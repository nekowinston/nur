{
  buildGo118Module,
  fetchFromGitHub,
  lib,
  ...
}:
buildGo118Module rec {
  pname = "helm-ls";
  version = "v0.0.3";

  src = fetchFromGitHub {
    owner = "mrjosh";
    repo = "helm-ls";
    rev = version;
    sha256 = "sha256-MiDbV+mfr1wcc0e0iwFPL8WniWKbPnr4zb79qniT2Kc=";
  };

  vendorSha256 = "sha256-EqZlmOoQtC3Iuf0LG2PL0K2pluGqbyA6132lzgF4+ic=";

  meta = with lib; {
    description = "helm language server";
    homepage = "https://github.com/mrjosh/helm-ls";
    license = licenses.mit;
  };
}
