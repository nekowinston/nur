{
  description = "nekowinston NUR repository";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...} @ inputs: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in {
    legacyPackages = forAllSystems (system:
      import ./default.nix {
        pkgs = import nixpkgs {inherit system;};
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
