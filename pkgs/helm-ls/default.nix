{
  buildGoModule,
  callPackage,
  lib,
}: let
  nvfetcher = (callPackage ../../_sources/generated.nix {}).helm-ls;
in
  buildGoModule {
    inherit (nvfetcher) pname version src;

    vendorSha256 = "sha256-wMYrgAgAEgwfjMLP81H0cKWm/kh63ppDkSiymfsaj7U=";

    meta = with lib; {
      description = "helm language server";
      homepage = "https://github.com/mrjosh/helm-ls";
      license = licenses.mit;
      platforms = platforms.unix;
    };
  }
