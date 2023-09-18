{
  pkgs ?
    import <nixpkgs> {
      inherit system;
      overlays = [(import (builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz"))];
    },
  system ? builtins.currentSystem,
}: let
  docs = import ./docs {
    inherit pkgs;
    lib = pkgs.lib;
  };
in {
  lib = import ./lib {inherit pkgs;}; # functions
  modules = import ./modules;
  overlays = import ./overlays; # nixpkgs overlays

  apple-cursor = pkgs.callPackage ./pkgs/apple-cursor {};
  apple-fonts = pkgs.callPackage ./pkgs/apple-fonts {};
  apple-emoji = pkgs.callPackage ./pkgs/apple-emoji {};
  cura = pkgs.callPackage ./pkgs/cura {};
  discover-overlay = pkgs.callPackage ./pkgs/discover-overlay {};
  gonvim-tools = pkgs.callPackage ./pkgs/gonvim-tools {};
  helm-ls = pkgs.callPackage ./pkgs/helm-ls {};
  icat = import (builtins.fetchTarball {
    url = "https://github.com/nekowinston/icat/archive/4c3497a35d4f5a665c25b6ad468025f4126eaa40.tar.gz";
    sha256 = "sha256:0j1lld2x0hhaw4c86m792f4h50dscxa9a9h79cnpi9margh99qx2";
  }) {inherit pkgs;};
  jq-lsp = pkgs.callPackage ./pkgs/jq-lsp {};
  mopidy-podcast-itunes = pkgs.callPackage ./pkgs/mopidy-podcast-itunes {};
  plymouth-theme-catppuccin = pkgs.callPackage ./pkgs/plymouth-theme-catppuccin {};
  posy-improved-cursor = pkgs.callPackage ./pkgs/posy-improved-cursor {};
  sizzy = pkgs.callPackage ./pkgs/sizzy {};
  uhk-agent = pkgs.callPackage ./pkgs/uhk-agent {};
  wezterm-nightly = pkgs.callPackage ./pkgs/wezterm-nightly {};

  docs-html = docs.html;
}
