{
  fetchurl,
  lib,
  p7zip,
  stdenvNoCC,
  undmg,
}:
stdenvNoCC.mkDerivation {
  pname = "apple-sf-mono";
  version = "18.0d1e1";

  src = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
    sha256 = "sha256-pqkYgJZttKKHqTYobBUjud0fW79dS5tdzYJ23we9TW4=";
  };

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
