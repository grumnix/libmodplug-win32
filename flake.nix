{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

    tinycmmc.url = "github:grumbel/tinycmmc";
    tinycmmc.inputs.nixpkgs.follows = "nixpkgs";

    libmodplug_src.url = "https://downloads.sourceforge.net/project/modplug-xmms/libmodplug/0.8.9.0/libmodplug-0.8.9.0.tar.gz";
    libmodplug_src.flake = false;
  };

  outputs = { self, nixpkgs, tinycmmc, libmodplug_src }:
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
