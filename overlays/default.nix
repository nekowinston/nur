final: prev: {
  catppuccin-gtk = prev.catppuccin-gtk.overrideAttrs (final: rec {
    version = "0.6.0";
    src = prev.fetchFromGitHub {
      owner = "catppuccin";
      repo = "gtk";
      rev = "v${version}";
      sha256 = "sha256-3HplAmlj8hK9Myy8mgvR88sMa2COmYAU75Fk1JuKtMc=";
    };
  });
  yabai = prev.yabai.overrideAttrs (oldAttrs: let
    version = "5.0.6";
    sources = {
      "aarch64-darwin" = prev.fetchzip {
        url = "https://github.com/koekeishiya/yabai/releases/download/v${version}/yabai-v${version}.tar.gz";
        sha256 = "sha256-wpm9VnR4yPk6Ybo/V2DMLgRcSzDl3dWGSKDCjYfz+xQ=";
      };
      "x86_64-darwin" = prev.fetchFromGitHub {
        owner = "koekeishiya";
        repo = "yabai";
        rev = "v${version}";
        sha256 = "sha256-1/h8f1FQNHn5eVprPVd0can8XHjNyF7j4H3LSN0K8rI=";
      };
    };
  in {
    inherit version;
    src = sources."${prev.stdenv.hostPlatform.system}" or (throw "Unsupported platform");
  });
}
