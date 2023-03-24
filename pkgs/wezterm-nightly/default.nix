{
  lib,
  wezterm,
  fetchFromGitHub,
}: let
  rev = "bc7acc18e02cdfee5d1ae72bf6b5d3b483479850";
  sha256 = "sha256-ZOx0pLjOOIPrGQssde0mA6JXZ/Y/xhv1qSl7uSf/k0s=";
  cargoSha256 = "sha256-ciZQRpKnvnBuDjZoOx3xxko6Nmvixb2y8wvOLxbh+Io=";
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
