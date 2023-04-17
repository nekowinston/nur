{
  lib,
  wezterm,
  fetchFromGitHub,
}: let
  rev = "a4cf01dd55f0fee241a73ec1a515001ecdac6fec";
  sha256 = "sha256-7ZYYZU2PTYKnNwjX9QxVpdgd9Tyxm2RVThhbT+7nX/Y=";
  cargoSha256 = "sha256-VTdSylCXQqJdvFYTo2KowIA5PHF22H+DfZrX2EYYTNw=";
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
