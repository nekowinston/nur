# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  apple-emoji = {
    pname = "apple-emoji";
    version = "v17.4";
    src = fetchurl {
      url = "https://github.com/samuelngs/apple-emoji-linux/releases/download/v17.4/AppleColorEmoji.ttf";
      sha256 = "sha256-SG3JQLybhY/fMX+XqmB/BKhQSBB0N1VRqa+H6laVUPE=";
    };
  };
  cura = {
    pname = "cura";
    version = "5.8.1";
    src = fetchurl {
      url = "https://github.com/Ultimaker/Cura/releases/download/5.8.1/Ultimaker-Cura-5.8.1-linux-X64.AppImage";
      sha256 = "sha256-VLd+V00LhRZYplZbKkEp4DXsqAhA9WLQhF933QAZRX0=";
    };
  };
  discover-overlay = {
    pname = "discover-overlay";
    version = "v0.7.8";
    src = fetchFromGitHub {
      owner = "trigg";
      repo = "discover";
      rev = "v0.7.8";
      fetchSubmodules = false;
      sha256 = "sha256-0b0uZDa9Q3pQ6X65C+E31dMpdTPt4vvHDEqFEtRoedg=";
    };
  };
  gpt4all = {
    pname = "gpt4all";
    version = "da21174fb1b6af65016535d254b3e0749b6a22ec";
    src = fetchFromGitHub {
      owner = "nomic-ai";
      repo = "gpt4all";
      rev = "da21174fb1b6af65016535d254b3e0749b6a22ec";
      fetchSubmodules = true;
      sha256 = "sha256-aez/APsei30Tp1em/RDCuq+v8hOavHq4O9qZahrsF/g=";
    };
    date = "2024-09-20";
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
  sf-compact = {
    pname = "sf-compact";
    version = "unknown";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg";
      sha256 = "sha256-L4oLQ34Epw1/wLehU9sXQwUe/LaeKjHRxQAF6u2pfTo=";
    };
  };
  sf-mono = {
    pname = "sf-mono";
    version = "unknown";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
      sha256 = "sha256-Uarx1TKO7g5yVBXAx6Yki065rz/wRuYiHPzzi6cTTl8=";
    };
  };
  sf-pro = {
    pname = "sf-pro";
    version = "unknown";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
      sha256 = "sha256-B8xljBAqOoRFXvSOkOKDDWeYUebtMmQLJ8lF05iFnXk=";
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
    version = "4.2.0";
    src = fetchurl {
      url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v4.2.0/UHK.Agent-4.2.0-linux-x86_64.AppImage";
      sha256 = "sha256-LemTr18Q5p6t4DKgWKzVDp92ec7E6MxHVOx7tOo8G5I=";
    };
  };
  wezterm = {
    pname = "wezterm";
    version = "2b76c63bb618d26609434c06282c8755229c4099";
    src = fetchFromGitHub {
      owner = "wez";
      repo = "wezterm";
      rev = "2b76c63bb618d26609434c06282c8755229c4099";
      fetchSubmodules = true;
      sha256 = "sha256-mX6Jg29G5UpgItW7zGdR5lxKfAWFX1+eVq2yByyGx9c=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./wezterm-2b76c63bb618d26609434c06282c8755229c4099/Cargo.lock;
      outputHashes = {
        "xcb-imdkit-0.3.0" = "sha256-77KaJO+QJWy3tJ9AF1TXKaQHpoVOfGIRqteyqpQaSWo=";
        "sqlite-cache-0.1.3" = "sha256-sBAC8MsQZgH+dcWpoxzq9iw5078vwzCijgyQnMOWIkk=";
      };
    };
    date = "2024-09-22";
  };
}
