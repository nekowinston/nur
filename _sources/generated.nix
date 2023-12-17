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
    version = "v0.7.1";
    src = fetchFromGitHub {
      owner = "catppuccin";
      repo = "gtk";
      rev = "v0.7.1";
      fetchSubmodules = false;
      sha256 = "sha256-V3JasiHaATbVDQJeJPeFq5sjbkQnSMbDRWsaRzGccXU=";
    };
  };
  cura = {
    pname = "cura";
    version = "5.6.0";
    src = fetchurl {
      url = "https://github.com/Ultimaker/Cura/releases/download/5.6.0/Ultimaker-Cura-5.6.0-linux-X64.AppImage";
      sha256 = "sha256-EHiWoNpLKHPzv6rZrtNgEr7y//iVcRYeV/TaCn8QpEA=";
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
  gpt4all = {
    pname = "gpt4all";
    version = "d1c56b8b28a7239f0ec0c3e07b0745cc527beeb5";
    src = fetchFromGitHub {
      owner = "nomic-ai";
      repo = "gpt4all";
      rev = "d1c56b8b28a7239f0ec0c3e07b0745cc527beeb5";
      fetchSubmodules = true;
      sha256 = "sha256-cujktIUrO87uGFTlc+r3ZT3kejvsXZUKvtstG8NZaKI=";
    };
    date = "2023-12-16";
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
    version = "3.2.2";
    src = fetchurl {
      url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v3.2.2/UHK.Agent-3.2.2-linux-x86_64.AppImage";
      sha256 = "sha256-0kNcpdYktgzIPVvfSitJ5aIuhJvCEcbubumHhW00QUE=";
    };
  };
  wezterm = {
    pname = "wezterm";
    version = "e3cd2e93d0ee5f3af7f3fe0af86ffad0cf8c7ea8";
    src = fetchFromGitHub {
      owner = "wez";
      repo = "wezterm";
      rev = "e3cd2e93d0ee5f3af7f3fe0af86ffad0cf8c7ea8";
      fetchSubmodules = true;
      sha256 = "sha256-sj3S1fWC6j9Q/Yc+4IpLbKC3lttUWFk65ROyCdQt+Zc=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./wezterm-e3cd2e93d0ee5f3af7f3fe0af86ffad0cf8c7ea8/Cargo.lock;
      outputHashes = {
        "xcb-1.2.1" = "sha256-zkuW5ATix3WXBAj2hzum1MJ5JTX3+uVQ01R1vL6F1rY=";
        "xcb-imdkit-0.2.0" = "sha256-L+NKD0rsCk9bFABQF4FZi9YoqBHr4VAZeKAWgsaAegw=";
      };
    };
    date = "2023-12-03";
  };
}
