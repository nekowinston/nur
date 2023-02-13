# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage
{pkgs ? import <nixpkgs> {}}: {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib {inherit pkgs;}; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  cura = pkgs.callPackage ./pkgs/cura {};
  discord-applemusic-rich-presence = pkgs.callPackage ./pkgs/discord-applemusic-rich-presence {};
  discover-overlay = pkgs.callPackage ./pkgs/discover-overlay {};
  helm-ls = pkgs.callPackage ./pkgs/helm-ls {};
  jq-lsp = pkgs.callPackage ./pkgs/jq-lsp {};
  mopidy-podcast-itunes = pkgs.callPackage ./pkgs/mopidy-podcast-itunes {};
  org-stats = pkgs.callPackage ./pkgs/org-stats {};
  picom-ft-labs = pkgs.callPackage ./pkgs/picom-ft-labs {};
  papirus-folders-catppuccin = pkgs.callPackage ./pkgs/papirus-folders-catppuccin {};
  vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools = pkgs.callPackage ./pkgs/vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools {};
}
