# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage
{
  pkgs ? import <nixpkgs> {},
  craneLib,
  wezterm-src,
  ...
}: {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib {inherit pkgs;}; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  catppuccin-gtk = pkgs.callPackage ./pkgs/catppuccin-gtk {};
  cura = pkgs.callPackage ./pkgs/cura {};
  discover-overlay = pkgs.callPackage ./pkgs/discover-overlay {};
  helm-ls = pkgs.callPackage ./pkgs/helm-ls {};
  jq-lsp = pkgs.callPackage ./pkgs/jq-lsp {};
  mopidy-podcast-itunes = pkgs.callPackage ./pkgs/mopidy-podcast-itunes {};
  papirus-folders-catppuccin = pkgs.callPackage ./pkgs/papirus-folders-catppuccin {};
  picom-ft-labs = pkgs.callPackage ./pkgs/picom-ft-labs {};
  plymouth-theme-catppuccin = pkgs.callPackage ./pkgs/plymouth-theme-catppuccin {};
  swww = pkgs.callPackage ./pkgs/swww {};
  vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools = pkgs.callPackage ./pkgs/vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools {};
  wezterm-nightly = pkgs.darwin.apple_sdk_11_0.callPackage ./pkgs/wezterm-nightly {
    stdenv = with pkgs;
      if stdenv.isDarwin
      then darwin.apple_sdk_11_0.stdenv
      else stdenv;
    inherit wezterm-src craneLib;
  };
}
