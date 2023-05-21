{pkgs}:
pkgs.catppuccin-gtk.overrideAttrs (final: rec {
  version = "0.6.0";
  src = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "gtk";
    rev = "v${version}";
    sha256 = "sha256-3HplAmlj8hK9Myy8mgvR88sMa2COmYAU75Fk1JuKtMc=";
  };
})
