{
	config,
	lib,
	my,
	pkgs,
	...
}: let
	inherit (lib) mkIf escapeShellArg;
	stateDir = "/mnt/persist/tejing/torrents";
	tmux_socket = "${stateDir}/tmux_socket";
	rpc_socket = "${stateDir}/rpc_socket";
	session_lock = "${stateDir}/session/rtorrent.lock";

	safely =
		my.lib.mkShellScript "safely"
		{
			inputs = [
				pkgs.coreutils
				pkgs.diffutils
			];
			execer = ["cannot:${pkgs.diffutils}/bin/diff"];
		}
		./safely;
	construct_torrent =
		pkgs.writeScript "construct_torrent" ''
		  #!${(pkgs.python3.withPackages (ps: [ps.fastbencode])).interpreter}
		  ${builtins.readFile ./construct_torrent}'';
	rtorrent-load =
		pkgs.writeScriptBin "rtorrent-load" ''
		  #!${pkgs.python3.interpreter}
		  ${builtins.readFile ./rtorrent-load}'';
	rtorrent_config = pkgs.writeText "rtorrent_config.rc" "  # Configure command paths\n  method.insert = cfg.cmd.bash,                 private|const|string,  \"${pkgs.bash}/bin/bash\"\n  method.insert = cfg.cmd.mkdir,                private|const|string,  \"${pkgs.coreutils}/bin/mkdir\"\n  method.insert = cfg.cmd.cp,                   private|const|string,  \"${pkgs.coreutils}/bin/cp\"\n  method.insert = cfg.cmd.rm,                   private|const|string,  \"${pkgs.coreutils}/bin/rm\"\n  method.insert = cfg.cmd.natpmpc,              private|const|string,  \"${pkgs.libnatpmp}/bin/natpmpc\"\n  method.insert = cfg.cmd.dig,                  private|const|string,  \"${pkgs.dnsutils}/bin/dig\"\n  method.insert = cfg.cmd.safely,               private|const|string,  \"${safely}\"\n  method.insert = cfg.cmd.construct_torrent,    private|const|string,  \"${construct_torrent}\"\n\n  # Configure directory paths\n  method.insert = cfg.path.session,             private|const|string,  \"${stateDir}/session\"\n  method.insert = cfg.path.logdir,              private|const|string,  \"${stateDir}/log\"\n  method.insert = cfg.path.active,              private|const|string,  \"${stateDir}/download\"\n  method.insert = cfg.path.completed,           private|const|string,  \"${config.home.homeDirectory}/data\"\n  method.insert = cfg.path.magnetinfo,          private|const|string,  \"${stateDir}/magnet\"\n  method.insert = cfg.path.torrentfiles,        private|const|string,  \"${stateDir}/torrentfiles\"\n\n  # Configure file paths\n  method.insert = cfg.path.rpc_socket,          private|const|string,  \"${rpc_socket}\"\n\n  # Configure ports\n  method.insert = cfg.port.tcp,                 private|const|string,  \"62813\"\n  method.insert = cfg.port.udp,                 private|const|string,  \"62813\"\n\n  # Configure process umask\n  method.insert = cfg.umask,                    private|const|string,  \"0022\"\n\n  # Nominal upload and download rates for my connection in mbps\n  method.insert = cfg.connection.up_mbps,       private|const|string,  \"10\"\n  method.insert = cfg.connection.down_mbps,     private|const|string,  \"400\"\n\n  # Percentage of nominal rates to use\n  method.insert = cfg.connection.up_percent,    private|const|string,  \"80\"\n  method.insert = cfg.connection.down_percent,  private|const|string,  \"80\"\n";
	start_rtorrent =
		my.lib.mkShellScript "start-rtorrent"
		{
			inputs = [pkgs.rtorrent];
			execer = ["cannot:${pkgs.rtorrent}/bin/rtorrent"];
		} "  exec rtorrent -I -n -o import=${rtorrent_config} -o import=${./rtorrent.rc}\n";

	clear_stale_lock =
		my.lib.mkShellScript "clear-stale-rtorrent-lock"
		{
			inputs = [
				pkgs.coreutils
				pkgs.nettools
			];
		}
		"  [[ -f ${escapeShellArg session_lock} ]] || exit 0\n  [[ \"$(< ${escapeShellArg session_lock})\" =~ ([^:]+):\\+([0-9]+) ]] || exit 0\n  [[ \"\${BASH_REMATCH[1]}\" == \"$(hostname)\" ]] || exit 0\n  [[ -d \"/proc/\${BASH_REMATCH[2]}\" ]] && [[ \"$(basename \"$(readlink \"/proc/\${BASH_REMATCH[2]}/exe\")\")\" == rtorrent ]] && exit 0\n  rm -f -- ${escapeShellArg session_lock}\n";

	tmux_config = builtins.toFile "rtorrent_tmux.conf" "";
	tmux_cmd = "tmux -S ${escapeShellArg tmux_socket} -f ${tmux_config}";

	start_daemon =
		my.lib.mkShellScript "start-rtorrent-daemon"
		{
			inputs = [pkgs.tmux];
			execer = [
				"cannot:${pkgs.tmux}/bin/tmux"
			]; # False, but I'm getting around it with explicit absolute paths
		}
		"  ${tmux_cmd} new-session -d -s rtorrent -n rtorrent -x 426 -y 118 ${start_rtorrent}\n  ${tmux_cmd} display-message -p '#{pid}' > \"$XDG_RUNTIME_DIR/rtorrent_tmux.pid\"\n";
	stop_daemon =
		my.lib.mkShellScript "stop-rtorrent-daemon"
		{
			inputs = [
				pkgs.coreutils
				pkgs.tmux
			];
			execer = ["cannot:${pkgs.tmux}/bin/tmux"]; # False, but doesn't matter here
		}
		"  ${tmux_cmd} send-keys -t rtorrent:rtorrent C-q\n  while ${tmux_cmd} -N has-session; do\n    sleep 0.5\n  done\n";

	rtorrent-attach =
		my.lib.mkShellScript "rtorrent-attach"
		{
			inputs = [
				pkgs.tmux
				pkgs.systemd
			];
			execer = [
				"cannot:${pkgs.systemd}/bin/systemctl"
				"cannot:${pkgs.tmux}/bin/tmux" # False, but doesn't matter here
			];
		}
		"  if [ \"$(systemctl --user show --property=ActiveState rtorrent.service)\" == \"ActiveState=active\" ]; then\n    exec ${tmux_cmd} attach-session\n  else\n    echo \"rtorrent.service not active\" >&2\n    exit 1\n  fi\n";
in {
	home.packages = [
		rtorrent-attach.pkg
		rtorrent-load
	];

	xdg.desktopEntries.rtorrent-load = {
		name = "RTorrent rpc torrent loader";
		comment = "Load a torrent into the running rtorrent instance.";
		exec = "${pkgs.writeShellScript "rtorrent-load-desktop-script" ''exec ${rtorrent-load}/bin/rtorrent-load -S ${escapeShellArg rpc_socket} "$@"''} %U";
		noDisplay = true;
		startupNotify = false;
		mimeType = [
			"application/x-bittorrent"
			"x-scheme-handler/magnet"
		];
	};

	systemd.user.services.rtorrent =
		mkIf (!my.isBuildVm) {
			Unit = {
				Description = "RTorrent bittorrent client";
				After = ["network.target"];
			};
			Install.WantedBy = ["default.target"];
			Service = {
				Type = "forking";
				PIDFile = "rtorrent_tmux.pid";
				ExecStartPre = "-${clear_stale_lock}";
				ExecStart = "${start_daemon}";
				ExecStop = "${stop_daemon}";
			};
		};

	xsession.windowManager.i3.config.assigns."10" = [
		{
			class = "^URxvt$";
			instance = "^rtorrent$";
		}
	];
	xsession.windowManager.i3.config.startup = [
		{
			command = "${my.launch.term} app rtorrent ${
				pkgs.writeShellScript "rtorrent-cycle" (
					if my.isBuildVm
					then "echo In a virtual machine, not running rtorrent;while true;do sleep 3600;done"
					else "while true; do rtorrent-attach; sleep 1;done"
				)
			}";
			always = false;
			notification = false;
		}
	];
}
