{
  buildGo118Module,
  fetchFromGitHub,
  lib,
  ...
}:
buildGo118Module {
  pname = "jq-lsp";
  version = "20221220";

  src = fetchFromGitHub {
    owner = "wader";
    repo = "jq-lsp";
    rev = "e962d87cf8db75c3a4aa08070e4ee48cceff01bf";
    sha256 = "sha256-/1Srce7IDsFTNg2dxwnF2GK2BPsaOB2TAFLI64dX/SQ=";
  };

  vendorSha256 = "sha256-ppQ81uERHBgOr/bm/CoDSWcK+IqHwvcL6RFi0DgoLuw=";

  meta = with lib; {
    description = "jq language server";
    homepage = "https://github.com/wader/jq-lsp";
    license = licenses.mit;
  };
}
