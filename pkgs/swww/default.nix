{
  fetchFromGitHub,
  lib,
  pkgs,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "swww";
  version = "0.7.3";

  src = fetchFromGitHub {
    owner = "Horus645";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-58zUi6tftTvNoc/R/HO4RDC7n+NODKOrBCHH8QntKSY=";
  };

  cargoSha256 = "sha256-hL5rOf0G+UBO8kyRXA1TqMCta00jGSZtF7n8ibjGi9k=";

  nativeBuildInputs = with pkgs; [pkg-config];
  buildInputs = with pkgs; [lz4 libxkbcommon];

  meta = with lib; {
    description = "A solution to your wayland wallpaper woes";
    homepage = "https://github.com/Horus645/swww";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
