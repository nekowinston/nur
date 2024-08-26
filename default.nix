{
  pkgs ? import <nixpkgs> {
    inherit system;
    config = { };
    overlays = [
      (import (builtins.fetchTarball "https://github.com/nix-community/fenix/archive/master.tar.gz"))
    ];
  },
  system ? builtins.currentSystem,
}:
let
  nvfetcher = pkgs.callPackage ./_sources/generated.nix { };
  docs = pkgs.callPackage ./docs { };
in
{
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules;
  overlays = import ./overlays; # nixpkgs overlays

  apple-cursor = pkgs.callPackage ./pkgs/apple-cursor { };
  apple-fonts = pkgs.callPackage ./pkgs/apple-fonts { };
  apple-emoji = pkgs.callPackage ./pkgs/apple-emoji { };
  cura = pkgs.callPackage ./pkgs/cura { };
  discover-overlay = pkgs.callPackage ./pkgs/discover-overlay { };
  gonvim-tools = pkgs.callPackage ./pkgs/gonvim-tools { };
  helm-ls = pkgs.callPackage ./pkgs/helm-ls { };
  icat = import (nvfetcher.icat.src) { inherit pkgs; };
  jq-lsp = pkgs.callPackage ./pkgs/jq-lsp { };
  posy-improved-cursor = pkgs.callPackage ./pkgs/posy-improved-cursor { };
  uhk-agent = pkgs.callPackage ./pkgs/uhk-agent { };
  wezterm-nightly =
    let
      callPackage =
        if pkgs.stdenv.isDarwin then pkgs.darwin.apple_sdk_11_0.callPackage else pkgs.callPackage;
    in
    callPackage ./pkgs/wezterm-nightly { };

  docs-md = docs.md;
  docs-html = docs.html;
}
