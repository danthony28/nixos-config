{
	lib,
	my,
	...
}: let
	inherit (builtins) listToAttrs;
	inherit (lib) nameValuePair removeSuffix;
	inherit (my.lib) listImportableExcept;
in
	dir: except: scope:
	# import every importable path in the directory 'dir', passing
	# argument 'arg', except files named in the list of strings 'except'.
	# returns an attrset of the import results named by the files (without
	# the .nix suffix) or directories they came from.
		listImportableExcept dir except
		|> map ( n: nameValuePair
			(n |> removeSuffix ".nix") # name
			(scopedImport scope (dir + "/${n}")) # value
		)
		|> listToAttrs
