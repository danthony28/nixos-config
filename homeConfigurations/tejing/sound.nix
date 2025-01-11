{
	config,
	lib,
	my,
	pkgs,
	...
}: {
	home.packages =
		builtins.attrValues {
			inherit
				(pkgs)
				mpc_cli
				ncmpc
				pulsemixer
				;
		};
	xsession.windowManager.i3.config.keybindings = let
		mod = config.xsession.windowManager.i3.config.modifier;
	in {
		"XF86AudioPrev" = "exec --no-startup-id ${pkgs.mpc_cli}/bin/mpc -q prev";
		"XF86AudioPlay" = "exec --no-startup-id ${pkgs.mpc_cli}/bin/mpc -q toggle";
		"XF86AudioStop" = "exec --no-startup-id ${pkgs.mpc_cli}/bin/mpc -q stop";
		"XF86AudioNext" = "exec --no-startup-id ${pkgs.mpc_cli}/bin/mpc -q next";
		"XF86AudioLowerVolume" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
		"XF86AudioRaiseVolume" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
		"XF86AudioMute" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
		"${mod}+F1" = "exec --no-startup-id ${pkgs.mpc_cli}/bin/mpc -q prev";
		"${mod}+F2" = "exec --no-startup-id ${pkgs.mpc_cli}/bin/mpc -q toggle";
		"${mod}+F3" = "exec --no-startup-id ${pkgs.mpc_cli}/bin/mpc -q stop";
		"${mod}+F4" = "exec --no-startup-id ${pkgs.mpc_cli}/bin/mpc -q next";
		"${mod}+F5" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
		"${mod}+F6" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
		"${mod}+F7" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
		"${mod}+F8" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle";
	};
	xsession.windowManager.i3.config.assigns."9" = [
		{
			class = "^URxvt$";
			instance = "^ncmpc$";
		}
	];
	xsession.windowManager.i3.config.startup = [
		{
			command = "${my.launch.term} app ncmpc ${pkgs.ncmpc}/bin/ncmpc";
			always = false;
			notification = false;
		}
	];

	# pactl commands in keybinds accumulate slight drift when used. Reset that drift regularly.
	systemd.user.services.normalize_pa_volume = {
		Unit.Description = "pulseaudio volume normalizer";
		Service.Environment = [
			"PATH=${lib.makeBinPath [
					pkgs.coreutils
					pkgs.gnugrep
					pkgs.pulseaudio
				]}"
		];
		Service.ExecStart = "${pkgs.writeShellScript "normalize_pa_volume" ''
			  set -euo pipefail
			  curvolume="$(pactl get-sink-volume @DEFAULT_SINK@ | egrep -o '[0-9]?[0-9]?[0-9]%' | head -n1 | egrep -o '[0-9]*')"
			  newvolume=$(((curvolume+2)/5*5))
			  pactl set-sink-volume @DEFAULT_SINK@ "$newvolume%"
			''}";
	};
	systemd.user.timers.normalize_pa_volume = {
		Unit.Description = "pulseaudio volume normalization timer";
		Install.WantedBy = ["timers.target"];
		Timer.OnCalendar = "daily";
	};

	services.mpd.enable = true;
	services.mpd.network.startWhenNeeded = true;
	services.mpd.dataDir = "/mnt/persist/tejing/mpd";
	services.mpd.musicDirectory =
		pkgs.runCommand "music-lib" {} ''
		  mkdir $out
		  ln -s /mnt/persist/share/unique/music $out
		  ln -s /mnt/persist/share/replaceable/ocremix $out
		  ln -s /mnt/persist/share/unique/unsorted_music $out
		  ln -s /mnt/persist/share/data/tejing/work/youtube_favorite_music $out
		'';
	services.mpd.extraConfig = ''
	  audio_output {
	         type     "pulse"
	         name     "pulseaudio"
	  }'';
	home.file.".config/ncmpc/config".text = ''
	  host = 127.0.0.1
	  port = 6600
	  enable-colors = yes
	  color background             = none
	  color title                  = none,dim/none
	  color title-bold             = cyan/none
	  color line                   = blue/none
	  color line-flags             = green/none
	  color list                   = none,dim/none
	  color list-bold              = cyan/none
	  color browser-directory      = cyan,dim/none
	  color browser-playlist       = magenta,dim/none
	  color progressbar            = cyan/none
	  color progressbar-background = blue,dim/none
	  color status-state           = green/none
	  color status-song            = none,dim/none
	  color status-time            = green/none
	  color alert                  = magenta/none
	'';
}
