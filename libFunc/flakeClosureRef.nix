{
	lib,
	pkgs,
	...
}: let
	inherit (builtins) concatMap attrValues concatStringsSep;
	inherit (lib) unique;

	flakesClosure = flakes:
		if flakes == []
		then []
		else flakes
			++ flakesClosure ( flakes
				|> concatMap ( flake:
					if flake ? inputs
					then flake.inputs |> attrValues
					else []
				)
			)
			|> unique
	;
	flakeClosureRef = flake:
		pkgs.writeText "flake-closure"
		( ( flakesClosure [flake] |> concatStringsSep "\n" ) + "\n" )
	;
in
	flakeClosureRef
