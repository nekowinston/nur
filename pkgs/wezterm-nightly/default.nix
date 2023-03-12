{
  lib,
  wezterm,
  fetchFromGitHub,
}:
wezterm.overrideAttrs (oldAttrs: rec {
  pname = "wezterm";
  version = "fe6280f082a845c404c648ee28573f6f5680cb49";
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "wez";
    repo = pname;
    rev = version;
    sha256 = "sha256-/earlE0WN2+OSc01PCGIDPE6attJBW2q+HWBuRJMkZo=";
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
    outputHash = "sha256-7V9NRZ3QU8aCy0ZQhpv+OdmP/7Ly47zNxn02kp8kvcA=";
  });
})
