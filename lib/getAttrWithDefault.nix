let
	inherit (builtins) hasAttr getAttr;
in
	_args:
	
	default: attr: set:
	# gets attribute 'attr' of set 'set', defaulting to 'default' if absent
		if set |> hasAttr attr
		then set |> getAttr attr
		else default
