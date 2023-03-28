{
  lib,
  wezterm,
  fetchFromGitHub,
}: let
  rev = "cb5252a246a74958c4478495476ac99931a3a3d7";
  sha256 = "sha256-MHyjLjkEC0AepKSTLWY4r2FpGm1hcKI3mQsefvas60A=";
  cargoSha256 = "sha256-JTFvdj5ob5Sd37YMzmZlrJk+D5SGGVS39lkk5nqZYEY=";
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
      name = "wezterm-nightly-vendor.tar.gz";
      inherit src;
      outputHash = cargoSha256;
    });
  })
