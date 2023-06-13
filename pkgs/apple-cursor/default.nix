{
  fetchFromGitHub,
  stdenvNoCC,
  python3Packages,
  zip,
}:
stdenvNoCC.mkDerivation rec {
  name = "apple-cursor";
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
}
