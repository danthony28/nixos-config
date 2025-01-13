{
	lib,
	my,
	...
}: let
	inherit (builtins) listToAttrs;
	inherit (lib) nameValuePair removeSuffix;
	inherit (my.lib) listImportable;
in
	dir:
	# import every importable path in the directory 'dir', returns an
	# attrset of the import results named by the files (without the .nix
	# suffix) or directories they came from.
		listImportable dir
		|> map ( n: nameValuePair
			(n |> removeSuffix ".nix") # name
			(import (dir + "/${n}")) # value
		)
		|> listToAttrs
