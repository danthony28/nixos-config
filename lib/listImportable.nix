{
	lib,
	my,
	...
}: let
	inherit (builtins) pathExists attrNames readDir;
	inherit (lib) hasSuffix filterAttrs;
	inherit (my.lib) getAttrWithDefault;
in
	dir:
	# list importable filenames in the directory 'dir',
	let
		conditionTable = n:
			{
				regular = n |> hasSuffix ".nix";
				directory =
					dir + "/${n}/default.nix"
					|> pathExists
				;
			}
		;
	in
		readDir dir
		|> filterAttrs ( n: v:
			conditionTable n
			|> getAttrWithDefault false v
		)
		|> attrNames
