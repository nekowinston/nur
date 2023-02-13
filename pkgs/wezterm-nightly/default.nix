{
  lib,
  wezterm,
  fetchFromGitHub,
}:
wezterm.overrideAttrs (oldAttrs: rec {
  pname = "wezterm-nightly";
  version = "nightly-2023-02-14";

  src = fetchFromGitHub {
    owner = "wez";
    repo = "wezterm";
    rev = "a5c2b1f3adb06054bf522cb3d350697938d6f8e9";
    sha256 = "sha256-dEL/GKE95y4pMs9bjuhp8s74VXgrbLrp8Ya20CFdMKI=";
    fetchSubmodules = true;
  };

  cargoDeps = oldAttrs.cargoDeps.overrideAttrs (lib.const {
    name = "wezterm-nightly-vendor.tar.gz";
    inherit src;
    outputHash = "sha256-WbggJ691T/zV/9LCvggd4R4gATZK93/dT4U6nY9CUi0=";
  });
})
