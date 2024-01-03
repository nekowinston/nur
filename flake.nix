{
  description = "nekowinston NUR repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in {
    legacyPackages = forAllSystems (system:
      import ./default.nix {
        pkgs = import nixpkgs {
          inherit system;
          overlays = [inputs.rust-overlay.overlays.default];
        };
      });
    packages = forAllSystems (
      system:
        nixpkgs.lib.filterAttrs
        (_: v: nixpkgs.lib.isDerivation v)
        inputs.self.legacyPackages.${system}
    );

    darwinModules.default = import ./modules/darwin;
    homeManagerModules.default = import ./modules/hm;
    overlays.default = import ./overlays;
  };

  nixConfig = {
    extra-substituters = ["https://nekowinston.cachix.org"];
    extra-trusted-public-keys = ["nekowinston.cachix.org-1:lucpmaO+JwtoZj16HCO1p1fOv68s/RL1gumpVzRHRDs="];
  };
}
