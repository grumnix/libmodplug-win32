{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";

    tinycmmc.url = "github:grumbel/tinycmmc";
    tinycmmc.inputs.nixpkgs.follows = "nixpkgs";
    tinycmmc.inputs.flake-utils.follows = "flake-utils";

    libmodplug_src.url = "https://downloads.sourceforge.net/project/modplug-xmms/libmodplug/0.8.9.0/libmodplug-0.8.9.0.tar.gz";
    libmodplug_src.flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, tinycmmc, libmodplug_src }:
    tinycmmc.lib.eachWin32SystemWithPkgs (pkgs:
      {
        packages = rec {
          default = libmodplug;

          libmodplug = pkgs.stdenv.mkDerivation {
            pname = "libmodplug";
            version = "1.22.2";

            src = libmodplug_src;

            nativeBuildInputs = [
            ];
          };
        };
      }
    );
}
