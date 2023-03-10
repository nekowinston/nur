{
  fetchFromGitHub,
  lib,
  pkgs,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "swww";
  version = "0.7.2";

  src = fetchFromGitHub {
    owner = "Horus645";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-1SmCeIlcjOX3yCvpfqQ82uq4h2xlGhX9OCwKb6jGK78=";
  };

  cargoSha256 = "sha256-08YM9yTCRJPHdOc1+7F3guYiP3y1WSi3/hzlDRVpitc=";

  nativeBuildInputs = with pkgs; [pkg-config];
  buildInputs = with pkgs; [lz4 libxkbcommon];

  meta = with lib; {
    description = "A solution to your wayland wallpaper woes";
    homepage = "https://github.com/Horus645/swww";
    license = licenses.gpl3;
  };
}
