{
  description = "nekowinston NUR repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    crane.url = "github:ipetkov/crane/v0.12.2";
    crane.inputs.nixpkgs.follows = "nixpkgs";
    wezterm-src = {
      type = "git";
      url = "https://github.com/wez/wezterm";
      submodules = true;
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
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
        inherit (inputs) wezterm-src;
        craneLib = inputs.crane.lib.${system};
        pkgs = import nixpkgs {
          inherit system;
        };
      });
    darwinModules.default = import ./modules/darwin;
    homeManagerModules.default = import ./modules/hm;
  };
}
