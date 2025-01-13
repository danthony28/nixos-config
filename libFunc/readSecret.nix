{
	my,
	pkgs,
	...
}: let
	inherit (builtins) trace readFile;

	readSecret =
		if my.lib.isRepoLocked
		then default: file: default
			|> trace ''
				WARNING: Building from locked repo. Secrets will be replaced with placeholders.
			''
		else default: file: readFile file
	;
in
	readSecret
