{
  callPackage,
  lib,
  stdenvNoCC,
}: let
  inherit (callPackage ../../_sources/generated.nix {}) apple-emoji;
in
  stdenvNoCC.mkDerivation {
    inherit (apple-emoji) pname version src;

    dontUnpack = true;
    dontBuild = true;

    installPhase = ''
      install -Dm644 $src "$out/share/fonts/truetype/Apple Color Emoji.ttf"
    '';

    meta = with lib; {
      description = "Apple Color Emoji for Linux";
      homepage = "https://github.com/samuelngs/apple-emoji-linux";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  }
