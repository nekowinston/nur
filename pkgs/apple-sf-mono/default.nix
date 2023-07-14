{
  callPackage,
  lib,
  p7zip,
  stdenvNoCC,
  undmg,
}: let
  nvfetcher = (callPackage ../../_sources/generated.nix {}).sf-mono;
in
  stdenvNoCC.mkDerivation {
    inherit (nvfetcher) pname version src;

    buildInputs = [p7zip undmg];

    unpackPhase = ''
      7z x -y $src
      7z x -y "SFMonoFonts/SF Mono Fonts.pkg"
      7z x -y "Payload~"
    '';

    installPhase = ''
      for f in Library/Fonts/*.otf; do
        install -D -m644 $f $out/share/fonts/$(basename $f)
      done
    '';

    meta = with lib; {
      description = "Apple SF Mono font";
      homepage = "https://developer.apple.com/fonts/";
      license = licenses.unfree;
      platforms = platforms.unix;
    };
  }
