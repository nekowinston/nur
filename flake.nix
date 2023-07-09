{
  description = "nekowinston NUR repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # utils
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    # builders
    crane.url = "github:ipetkov/crane/v0.11.3";
    crane.inputs.nixpkgs.follows = "nixpkgs";

    # upstreams
    icat.url = "github:nekowinston/icat";
    icat.inputs.nixpkgs.follows = "nixpkgs";
    wezterm-src = {
      type = "git";
      url = "https://github.com/wez/wezterm";
      submodules = true;
      flake = false;
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in
    {
      packages = forAllSystems (system: let
        inherit (inputs) wezterm-src;
        craneLib = inputs.crane.lib.${system};
        pkgs = import nixpkgs {inherit system;};
      in {
        apple-cursor = pkgs.callPackage ./pkgs/apple-cursor {};
        cura = pkgs.callPackage ./pkgs/cura {};
        discover-overlay = pkgs.callPackage ./pkgs/discover-overlay {};
        gonvim-tools = pkgs.callPackage ./pkgs/gonvim-tools {};
        helm-ls = pkgs.callPackage ./pkgs/helm-ls {};
        icat = inputs.icat.packages.${system}.icat;
        jq-lsp = pkgs.callPackage ./pkgs/jq-lsp {};
        mopidy-podcast-itunes = pkgs.callPackage ./pkgs/mopidy-podcast-itunes {};
        picom-ft-labs = pkgs.callPackage ./pkgs/picom-ft-labs {};
        plymouth-theme-catppuccin = pkgs.callPackage ./pkgs/plymouth-theme-catppuccin {};
        posy-improved-cursor = pkgs.callPackage ./pkgs/posy-improved-cursor {};
        swww = pkgs.callPackage ./pkgs/swww {};
        wezterm-nightly = pkgs.darwin.apple_sdk_11_0.callPackage ./pkgs/wezterm-nightly {
          stdenv = with pkgs;
            if stdenv.isDarwin
            then darwin.apple_sdk_11_0.stdenv
            else stdenv;
          inherit wezterm-src craneLib;
        };
      });
    }
    // {
      darwinModules.default = import ./modules/darwin;
      homeManagerModules.default = import ./modules/hm;
      overlays.default = import ./overlays;
    };
}
