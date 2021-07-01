with import <nixpkgs> { config.allowUnfree = true; };

let
	unstable = import (fetchTarball "channel:nixos-unstable") { config = config; };
in stdenv.mkDerivation {
	name = "env";
	buildInputs = [
		ruby
		bundler
	];
}
