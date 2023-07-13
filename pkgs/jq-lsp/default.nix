{
  buildGoModule,
  callPackage,
  lib,
}: let
  nvfetcher = (callPackage ../../_sources/generated.nix {}).jq-lsp;
in
  buildGoModule {
    inherit (nvfetcher) pname version src;

    vendorSha256 = "sha256-ppQ81uERHBgOr/bm/CoDSWcK+IqHwvcL6RFi0DgoLuw=";

    meta = with lib; {
      description = "jq language server";
      homepage = "https://github.com/wader/jq-lsp";
      license = licenses.mit;
      platform = platforms.unix;
    };
  }
