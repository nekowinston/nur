{
  fetchFromGitHub,
  lib,
  python3Packages,
  stdenvNoCC,
  zip,
}:
stdenvNoCC.mkDerivation rec {
  pname = "apple-cursor";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "ful1e5";
    repo = "apple_cursor";
    rev = "v${version}";
    sha256 = "sha256-RpilcHDMuJL0Y2cvdu5j98YOYyShRJn3mK/hKGE1lS4=";
  };

  nativeBuildInputs = [
    python3Packages.attrs
    python3Packages.clickgen
    zip
  ];

  buildPhase = ''
    patchShebangs .
    ./release.sh
  '';

  installPhase = ''
    install -dm 755 $out/share/icons
    cp -dr --no-preserve='ownership' themes/macOS-{BigSur,BigSur-White,Monterey,Monterey-White} $out/share/icons
  '';

  meta = with lib; {
    description = "Open source macOS Cursors.";
    homepage = "https://github.com/ful1e5/apple_cursor";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
