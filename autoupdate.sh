#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix-prefetch jq
#shellcheck shell=bash
set -euo pipefail
IFS=$'\n\t'

name="wezterm-nightly"
owner="wez"
repo="wezterm"

rev=$(curl -fsSL "https://api.github.com/repos/${owner}/${repo}/commits?per_page=1" | jq -r '.[0].sha')

repoSha=$(nix-prefetch fetchFromGitHub --owner "$owner" --repo "$repo" --rev "$rev")
cargoSha256=$(nix-prefetch "{sha256}: let pkgs = import ./default.nix {}; pkg = pkgs.${name}.overrideAttrs (_: { src = pkgs.fetchFromGitHub { owner = \"${owner}\"; repo = \"${repo}\"; rev = \"${rev}\"; sha256 = \"${repoSha}\"; fetchSubmodules = true; }; }); in pkgs.wezterm-nightly.cargoDeps.overrideAttrs (_: {cargoSha256 = sha256;})")

dir="$(dirname "$0")"
cat >./"${dir}/meta/${name}.nix" <<EOF
{
  owner = "${owner}";
  repo = "${repo}";
  rev = "${rev}";
  sha256 = "${repoSha}";
  cargoSha256 = "${cargoSha256}";
}
EOF
