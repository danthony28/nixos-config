{
	lib,
	pkgs,
	...
}: let
	inherit (builtins) isList isAttrs isString isPath readFile;
	inherit (pkgs) resholve;

	mkShellScript = name: arg: content:
		assert
			arg
			|> isList
			|| arg
			|> isAttrs
		;
		assert
			content
			|> isString
			|| content
			|> isPath
		;
		let
			finalArg =
				{
					interpreter = "${pkgs.bash}/bin/bash";
					inputs =
						[pkgs.coreutils]
						++ (
							if isList arg
							then arg
							else []
						);
				}
				// (
					if isAttrs arg
					then arg
					else {}
				)
			;
			finalContent =
				if content |> isPath
				then readFile content
				else content
			;
		in rec {
			pkg =
				finalContent
				|> resholve.writeScriptBin name finalArg
			;
			outPath = "${pkg}/bin/${name}";
		};
in
	mkShellScript
