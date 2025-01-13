{
	lib,
	pkgs,
	...
}: let
	inherit (builtins) mapAttrs concatMap attrValues toJSON listToAttrs;
	inherit (pkgs) runCommand;
	inherit (lib) nameValuePair concatStrings mapAttrsToList;
	inherit (lib.strings) escapeNixIdentifier escapeNixString;

	cleanNode = flake: let
		spec = {
			type = "path";
			path = flake.outPath;
			inherit (flake) narHash;
		};
		extra =
			if flake ? outputs
			then {}
			else {flake = false;}
		;
	in
		{
			inputs =
				flake.inputs or {}
				|> mapAttrs (_: cleanNode)
			;
			locked = spec;
			original = spec;
		}
		// extra;
	flattenNode = prefix: node: let
		ids =
			node.inputs
			|> mapAttrs ( n: v: ( v
				|> flattenNode (prefix + "-" + n)
			).name )
		;
		nod =
			node.inputs
			|> mapAttrs ( n: v: ( v
				|> flattenNode (prefix + "-" + n)
			).value )
			|> attrValues
			|> concatMap (x: x)
			## TODO: Why not just `builtins.concatLists`?
		;
	in
		nameValuePair
			prefix # name
			(
				[ ( nameValuePair
					prefix # name
					(node // {inputs = ids;}) # value
				) ]
				++ nod
			) # value
		;
in
	flakeInputs: let
		inputsCode = "{${concatStrings (
				mapAttrsToList (n: v: "${escapeNixIdentifier n}.url=${escapeNixString "path:${v.sourceInfo.outPath}?narHash=${v.sourceInfo.narHash}"};") flakeInputs
			)}}";
		rootNode = {
			inputs =
				flakeInputs
				|> mapAttrs (_: cleanNode)
			;
		};
		lockJSON = toJSON {
			version = 7;
			root = "self";
			nodes =
				(flattenNode "self" rootNode).value
				|> listToAttrs
			;
		};
	in
		outputsCode:
			runCommand "source" {} ''
			  mkdir -p $out
			  cat <<"EOF" >$out/flake.nix
			  {inputs=${inputsCode};outputs=${outputsCode};}
			  EOF
			  cat <<"EOF" >$out/flake.lock
			  ${lockJSON}
			  EOF
			''
