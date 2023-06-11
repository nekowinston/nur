{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation rec {
  pname = "posy-improved-cursor";
  version = "2022-09-14";

  src = fetchFromGitHub {
    owner = "simtrami";
    repo = "${pname}-linux";
    rev = "8c39b915bbba4717a450ef750fa8b0c0b60cb160";
    sha256 = "sha256-i0N/QB5uzqHapMCDl6h6PWPJ4GOAyB1ds9qlqmZacLY=";
  };

  installPhase = ''
    install -dm 755 $out/share/icons
    cp -dr --no-preserve='ownership' Posy_Cursor* $out/share/icons/
  '';

  meta = with lib; {
    description = "Posy's improved cursors by Michiel de Boer, available as cursor themes.";
    homepage = "https://github.com/simtrami/posy-improved-cursor-linux";
    license = licenses.unfree;
    platforms = platforms.all;
  };
}
