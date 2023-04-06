{
  lib,
  wezterm,
  fetchFromGitHub,
}: let
  rev = "e3e9821c4d2b32f8fafe841eafe53eb25608f50f";
  sha256 = "sha256-SYK6MTbOnqd1O5KgFpFboyA3K7Dc6M44t1x8auyaLxY=";
  cargoSha256 = "sha256-dc6qcofUHKtduRj1SpZxQhX53gSaif342g4Eknl9s/w=";
in
  wezterm.overrideAttrs (oldAttrs: rec {
    pname = "wezterm";
    version = builtins.substring 0 7 rev;
    name = "${pname}-${version}";

    src = fetchFromGitHub {
      owner = "wez";
      repo = pname;
      inherit rev sha256;
      fetchSubmodules = true;
    };

    patches = [];

    postPatch = ''
      echo ${version}  > .tag
      # tests are failing with: Unable to exchange encryption keys
      rm -r wezterm-ssh/tests
    '';

    cargoDeps = oldAttrs.cargoDeps.overrideAttrs (lib.const {
      name = "wezterm-nightly-vendor-${version}.tar.gz";
      inherit src;
      outputHash = cargoSha256;
    });
  })
