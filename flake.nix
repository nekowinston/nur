{
  description = "nekowinston NUR repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # builders
    crane.url = "github:ipetkov/crane/v0.12.2";
    crane.inputs.nixpkgs.follows = "nixpkgs";
    crane.inputs.flake-compat.follows = "";

    # upstreams
    icat.url = "github:nekowinston/icat";
    icat.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in {
    packages = forAllSystems (system: let
      craneLib = inputs.crane.lib.${system};
      pkgs = import nixpkgs {inherit system;};
      docs = import ./docs {
        inherit pkgs;
        lib = pkgs.lib;
      };
    in {
      apple-cursor = pkgs.callPackage ./pkgs/apple-cursor {};
      cura = pkgs.callPackage ./pkgs/cura {};
      discover-overlay = pkgs.callPackage ./pkgs/discover-overlay {};
      gonvim-tools = pkgs.callPackage ./pkgs/gonvim-tools {};
      helm-ls = pkgs.callPackage ./pkgs/helm-ls {};
      icat = inputs.icat.packages.${system}.icat;
      jq-lsp = pkgs.callPackage ./pkgs/jq-lsp {};
      mopidy-podcast-itunes = pkgs.callPackage ./pkgs/mopidy-podcast-itunes {};
      plymouth-theme-catppuccin = pkgs.callPackage ./pkgs/plymouth-theme-catppuccin {};
      posy-improved-cursor = pkgs.callPackage ./pkgs/posy-improved-cursor {};
      wezterm-nightly = pkgs.callPackage ./pkgs/wezterm-nightly {inherit craneLib;};

      docs-html = docs.html;
    });
    darwinModules.default = import ./modules/darwin;
    homeManagerModules.default = import ./modules/hm;
    overlays.default = import ./overlays;
  };
}
