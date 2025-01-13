inputs @ {nixpkgs, ...}: let
	inherit (builtins) listToAttrs;
	inherit (nixpkgs.lib) nameValuePair;

	# functions needed to construct 'lib' itself
	bootstrapFunctions = [
		"importAllExceptWithArg"
		"listImportableExcept"
		"listImportable"
		"getAttrWithDefault"
	];

	# arguments to files in this directory during bootstrap
	initialArgs =
		inputs
		// {
			inherit inputs;
			inherit (nixpkgs) lib;
			my.lib = initialLib;
		}
	;

	# bootstrap lib containing only 'bootstrapFunctions'
	initialLib =
		bootstrapFunctions
		|> map ( n: nameValuePair
			n
			(import (./. + "/${n}.nix") initialArgs)
		)
		|> listToAttrs
	;

	# arguments to files for externally visible 'lib'
	finalArgs =
		initialArgs
		// {
			my.lib = finalLib;
		}
	;

	# externally visible 'lib'
	finalLib = initialLib.importAllExceptWithArg ./. ["default.nix"] finalArgs;
in
	finalLib
