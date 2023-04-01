{
  fetchFromGitHub,
  lib,
  pkgs,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "vivid";
  version = "4d7fb24d5481cb104292b97a993fc4448d854bc1";

  src = fetchFromGitHub {
    owner = "sharkdp";
    repo = "vivid";
    rev = version;
    sha256 = "sha256-rfEkeNrC5LHmUnTGv3tpIzpF+aSDCNmsnNsBQ/GC3Q4=";
  };

  cargoSha256 = "sha256-1Jka3ykVe2kbqxMHzriNDhrwzXWwiJWqW+Yuv0sweA0=";

  meta = with lib; {
    description = "A themeable LS_COLORS generator with a rich filetype datebase";
    homepage = "https://github.com/sharkdp/vivid";
    license = licenses.asl20;
    maintainers = [maintainers.nekowinston];
  };
}
