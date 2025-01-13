{lib, ...}: let
	inherit (builtins) isPath isList readFile filter match replaceStrings;
	inherit (lib) splitString hasAttrByPath getAttrFromPath;
in
	subs: src:
	# generate a string from a 'src' template containing @foo@-style
	# references which are expanded to corresponding values in the 'subs'
	# attrset
	let
		contents =
			if src |> isPath
			then readFile src
			else src;
		# the string is a sequence of dot-separated valid nix identifiers.
		isValid = s: s
			|> builtins.match "([a-zA-Z_][a-zA-Z0-9_'-]*(.[a-zA-Z_][a-zA-Z0-9_'-]*)*)"
			|> isList
			# the path actually exists in subs
			&& subs
			|> hasAttrByPath ( s |> splitString "." )
		;
		needed =
			contents
			|> splitString "@"
			|> filter isValid
		;
	in
		contents
		|> replaceStrings
		( needed |> map ( s: "@" + s + "@" ) )
		( needed |> map ( s: subs
			|> getAttrFromPath ( s |> splitString "." )
			|> toString
		) )
