{
  lib,
  wezterm,
  fetchFromGitHub,
}:
wezterm.overrideAttrs (oldAttrs: rec {
  pname = "wezterm";
  version = "2d05f8f1f24db6370f0791e9ec3a98ad38cf8b4d";
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "wez";
    repo = pname;
    rev = version;
    sha256 = "sha256-GL7vGne8fQIcu2u2lc5WOcPJfF6jlUZl3kKUPfkJEjc=";
    fetchSubmodules = true;
  };

  patches = [];

  postPatch = ''
    echo ${version} > .tag
    # tests are failing with: Unable to exchange encryption keys
    rm -r wezterm-ssh/tests
  '';

  cargoDeps = oldAttrs.cargoDeps.overrideAttrs (lib.const {
    name = "wezterm-nightly-vendor.tar.gz";
    inherit src;
    outputHash = "sha256-7nSod8Pg5GSLO1jEC5r8zmM90Ys2sQ8lGKvYzQNouLA=";
  });
})
