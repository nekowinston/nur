{
  lib,
  wezterm,
  fetchFromGitHub,
}:
wezterm.overrideAttrs (oldAttrs: rec {
  pname = "wezterm-nightly";
  version = "nightly-2023-03-02";

  patches = [];

  src = fetchFromGitHub {
    owner = "wez";
    repo = "wezterm";
    rev = "2d05f8f1f24db6370f0791e9ec3a98ad38cf8b4d";
    sha256 = "sha256-GL7vGne8fQIcu2u2lc5WOcPJfF6jlUZl3kKUPfkJEjc=";
    fetchSubmodules = true;
  };

  cargoDeps = oldAttrs.cargoDeps.overrideAttrs (lib.const {
    name = "wezterm-nightly-vendor.tar.gz";
    inherit src;
    outputHash = "sha256-7nSod8Pg5GSLO1jEC5r8zmM90Ys2sQ8lGKvYzQNouLA=";
  });
})
