{
  lib,
  wezterm,
  fetchFromGitHub,
}: let
  rev = "2c9fd0ef6ceb978f0f1c8bf05f5cb9c047e3e062";
  sha256 = "sha256-K7VZY3JQ+kf6Rvr2zYmtNBuRIWWRBgorzGANCJzS6Gg=";
  cargoSha256 = "sha256-oXS5Ingn2d3gqBupryoXAub1rDdKeOViRoZetFO0hm4=";
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
