{
  description = "nekowinston NUR repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    crane = {
      url = "github:ipetkov/crane/v0.12.2";
      inputs.flake-compat.follows = "";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
    };
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
        craneLib = inputs.crane;
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

    devShells = forAllSystems (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      default = pkgs.mkShell {
        name = "nekowinston-nur";
        buildInputs = with pkgs; [nvfetcher];
      };
    });
  };
}
