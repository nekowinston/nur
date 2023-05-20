{
  description = "nekowinston NUR repository";

  inputs = {
    crane.url = "github:ipetkov/crane/v0.11.3";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    wezterm-src = {
      type = "git";
      url = "https://github.com/wez/wezterm";
      submodules = true;
      flake = false;
    };
  };

  outputs = {
    self,
    crane,
    nixpkgs,
    wezterm-src,
  }: let
    systems = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "armv7l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in {
    packages = forAllSystems (system:
      import ./default.nix {
        inherit wezterm-src;
        craneLib = crane.lib.${system};
        pkgs = import nixpkgs {
          inherit system;
        };
      });
    devShells = forAllSystems (system:
      import ./shell.nix {
        pkgs = import nixpkgs {
          inherit system;
        };
      });
  };
}
