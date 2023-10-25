# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  apple-emoji = {
    pname = "apple-emoji";
    version = "v16.4-patch.1";
    src = fetchurl {
      url = "https://github.com/samuelngs/apple-emoji-linux/releases/download/v16.4-patch.1/AppleColorEmoji.ttf";
      sha256 = "sha256-1e1Xz7wF1NhCe0zUdJWXE6hPGmkylAeggsN01T3WWpU=";
    };
  };
  catppuccin-gtk = {
    pname = "catppuccin-gtk";
    version = "v0.7.0";
    src = fetchFromGitHub {
      owner = "catppuccin";
      repo = "gtk";
      rev = "v0.7.0";
      fetchSubmodules = false;
      sha256 = "sha256-J1iLN2FF3Ml/3zmntXYlfkv6dZcwl62A9X4ruAH1ll4=";
    };
  };
  cura = {
    pname = "cura";
    version = "5.4.0";
    src = fetchurl {
      url = "https://github.com/Ultimaker/Cura/releases/download/5.4.0/Ultimaker-Cura-5.4.0-linux-modern.AppImage";
      sha256 = "sha256-QVv7Wkfo082PH6n6rpsB79st2xK2+Np9ivBg/PYZd74=";
    };
  };
  discover-overlay = {
    pname = "discover-overlay";
    version = "0.6.9";
    src = fetchurl {
      url = "https://pypi.org/packages/source/d/discover-overlay/discover-overlay-0.6.9.tar.gz";
      sha256 = "sha256-14UmxAF4X0GnPokZeXAqeZYdSDUPrE3ZpNDUdk64Bik=";
    };
  };
  go-enum = {
    pname = "go-enum";
    version = "v0.5.6";
    src = fetchFromGitHub {
      owner = "abice";
      repo = "go-enum";
      rev = "v0.5.6";
      fetchSubmodules = false;
      sha256 = "sha256-epGtBHngAFClrU63y5QQ130Me/lrZw4J2ZDWEuOh8Uo=";
    };
  };
  gomvp = {
    pname = "gomvp";
    version = "v0.0.4";
    src = fetchFromGitHub {
      owner = "abenz1267";
      repo = "gomvp";
      rev = "v0.0.4";
      fetchSubmodules = false;
      sha256 = "sha256-dXjI+nItJCAGKxyC9tX11hxWHCP+NgXtTYtm5+6dqDU=";
    };
  };
  gpt4all = {
    pname = "gpt4all";
    version = "3444a47cad6d6d8dd6ec9d74cf5afebd78afe430";
    src = fetchFromGitHub {
      owner = "nomic-ai";
      repo = "gpt4all";
      rev = "3444a47cad6d6d8dd6ec9d74cf5afebd78afe430";
      fetchSubmodules = true;
      sha256 = "sha256-rL+31MtswtenLf5AqAv8+bP8FrW1bS1ps77JjNEG0+o=";
    };
    date = "2023-10-24";
  };
  helm-ls = {
    pname = "helm-ls";
    version = "61debb2d6cdafc978c217c9641e606314c0a42d5";
    src = fetchFromGitHub {
      owner = "mrjosh";
      repo = "helm-ls";
      rev = "61debb2d6cdafc978c217c9641e606314c0a42d5";
      fetchSubmodules = false;
      sha256 = "sha256-cEwF52rxQVNrUK7XJHoyBj/PXEueHCrRi7sLe4HoD6I=";
    };
  };
  icat = {
    pname = "icat";
    version = "4c3497a35d4f5a665c25b6ad468025f4126eaa40";
    src = fetchFromGitHub {
      owner = "nekowinston";
      repo = "icat";
      rev = "4c3497a35d4f5a665c25b6ad468025f4126eaa40";
      fetchSubmodules = false;
      sha256 = "sha256-ouOU4MuqpngtSwcmlVRnuoECiRPpVIMY4QpC0EWjNEg=";
    };
    date = "2023-07-15";
  };
  jq-lsp = {
    pname = "jq-lsp";
    version = "3e03c22ede27a39a0fff5c1a60a81f7397cd0811";
    src = fetchFromGitHub {
      owner = "wader";
      repo = "jq-lsp";
      rev = "3e03c22ede27a39a0fff5c1a60a81f7397cd0811";
      fetchSubmodules = false;
      sha256 = "sha256-+cJgRRopeTwtJT6nqcpeCKfBVNFA+vDgg4VY0ZQ/roE=";
    };
  };
  json-to-struct = {
    pname = "json-to-struct";
    version = "1f65fffbfdbb2b0e56a3f6f6cd24daad58e90dec";
    src = fetchFromGitHub {
      owner = "tmc";
      repo = "json-to-struct";
      rev = "1f65fffbfdbb2b0e56a3f6f6cd24daad58e90dec";
      fetchSubmodules = false;
      sha256 = "sha256-l/XLZstZFVnYXRqtng1oiCSvhNAomyeTuI1OtCb8UHo=";
    };
  };
  mopidy-podcast-itunes = {
    pname = "mopidy-podcast-itunes";
    version = "3.0.1";
    src = fetchurl {
      url = "https://pypi.org/packages/source/M/Mopidy-Podcast-iTunes/Mopidy-Podcast-iTunes-3.0.1.tar.gz";
      sha256 = "sha256-sxowRHUGiUr7dKoNKs4htFJccEaBqvyvzINmrZIZIds=";
    };
  };
  sf-compact = {
    pname = "sf-compact";
    version = "unknown";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg";
      sha256 = "sha256-+Q4HInJBl3FLb29/x9utf7A55uh5r79eh/7hdQDdbSI=";
    };
  };
  sf-mono = {
    pname = "sf-mono";
    version = "unknown";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
      sha256 = "sha256-pqkYgJZttKKHqTYobBUjud0fW79dS5tdzYJ23we9TW4=";
    };
  };
  sf-pro = {
    pname = "sf-pro";
    version = "unknown";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
      sha256 = "sha256-nkuHge3/Vy8lwYx9z+pvsQZfzrNIP4K0OutpPl4yXn0=";
    };
  };
  sizzy-darwin-arm = {
    pname = "sizzy-darwin-arm";
    version = "72.2.0";
    src = fetchurl {
      url = "https://proxy.sizzy.co/updates/download/mac?arch=arm64";
      sha256 = "sha256-+wT1xrOo4FB/uixSjKHwKyNtCBZomolkpZvFYG1c8lU=";
    };
  };
  sizzy-darwin-x64 = {
    pname = "sizzy-darwin-x64";
    version = "72.2.0";
    src = fetchurl {
      url = "https://proxy.sizzy.co/updates/download/mac?arch=x64";
      sha256 = "sha256-owoWvYSgaBNnfVD7EiDJlNgZG386QQgydqReqSxpCyY=";
    };
  };
  sizzy-linux = {
    pname = "sizzy-linux";
    version = "72.2.0";
    src = fetchurl {
      url = "https://proxy.sizzy.co/updates/download/linux?arch=x64";
      sha256 = "sha256-L9OkwzctH8IaM0nX4xa9MrWm4xp3Ocnuvr0BR/t+bNs=";
    };
  };
  uhk-agent = {
    pname = "uhk-agent";
    version = "3.1.0";
    src = fetchurl {
      url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v3.1.0/UHK.Agent-3.1.0-linux-x86_64.AppImage";
      sha256 = "sha256-KFuB1cbrEDfqeRyrhXZs4ClhdIjZqIT5a+rnvdi3kpA=";
    };
  };
  wezterm = {
    pname = "wezterm";
    version = "fec90ae04bf448d4b1475ba1d0ba1392846a70d6";
    src = fetchFromGitHub {
      owner = "wez";
      repo = "wezterm";
      rev = "fec90ae04bf448d4b1475ba1d0ba1392846a70d6";
      fetchSubmodules = true;
      sha256 = "sha256-7eMeNdmo8vpSnoPamShdLSTAUcK/mCiEpL30t+5spvc=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./wezterm-fec90ae04bf448d4b1475ba1d0ba1392846a70d6/Cargo.lock;
      outputHashes = {
        "xcb-1.2.1" = "sha256-zkuW5ATix3WXBAj2hzum1MJ5JTX3+uVQ01R1vL6F1rY=";
        "xcb-imdkit-0.2.0" = "sha256-L+NKD0rsCk9bFABQF4FZi9YoqBHr4VAZeKAWgsaAegw=";
      };
    };
    date = "2023-10-17";
  };
}
