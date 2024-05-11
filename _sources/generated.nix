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
    version = "5.7.1";
    src = fetchurl {
      url = "https://github.com/Ultimaker/Cura/releases/download/5.7.1/Ultimaker-Cura-5.7.1-linux-X64.AppImage";
      sha256 = "sha256-LZMD0fo8TSlDEJspvTka724lYq5EgrOlDkwMktXqATw=";
    };
  };
  discover-overlay = {
    pname = "discover-overlay";
    version = "v0.7.4";
    src = fetchFromGitHub {
      owner = "trigg";
      repo = "discover";
      rev = "v0.7.4";
      fetchSubmodules = false;
      sha256 = "sha256-qA+gvgKQlTjcm0JPUmJp47Ttvm+69CW4lOngnueLVpo=";
    };
  };
  gpt4all = {
    pname = "gpt4all";
    version = "1427ef7195d796402799891d7607e6d382c7d90c";
    src = fetchFromGitHub {
      owner = "nomic-ai";
      repo = "gpt4all";
      rev = "1427ef7195d796402799891d7607e6d382c7d90c";
      fetchSubmodules = true;
      sha256 = "sha256-K/VlBUp1zpd2Bi+/Uw9OZBvkyFi8317nCz2v/kzGSew=";
    };
    date = "2024-05-09";
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
      sha256 = "sha256-Mkf+GK4iuUhZdUdzMW0VUOmXcXcISejhMeZVm0uaRwY=";
    };
  };
  sf-mono = {
    pname = "sf-mono";
    version = "unknown";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
      sha256 = "sha256-tZHV6g427zqYzrNf3wCwiCh5Vjo8PAai9uEvayYPsjM=";
    };
  };
  sf-pro = {
    pname = "sf-pro";
    version = "unknown";
    src = fetchurl {
      url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
      sha256 = "sha256-Mu0pmx3OWiKBmMEYLNg+u2MxFERK07BQGe3WAhEec5Q=";
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
    version = "4.1.0";
    src = fetchurl {
      url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v4.1.0/UHK.Agent-4.1.0-linux-x86_64.AppImage";
      sha256 = "sha256-5VzUSuq+yc8HXSILMg24w/hbwasf4jq0H0wte9Mw+nY=";
    };
  };
  wezterm = {
    pname = "wezterm";
    version = "79ce027d3805ed43ff533b19802a4a2e7d9a9623";
    src = fetchFromGitHub {
      owner = "wez";
      repo = "wezterm";
      rev = "79ce027d3805ed43ff533b19802a4a2e7d9a9623";
      fetchSubmodules = true;
      sha256 = "sha256-hws7UpwYFdWE2t1h6iBZx8yONMAoHHPjFASTNqo3GqM=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./wezterm-79ce027d3805ed43ff533b19802a4a2e7d9a9623/Cargo.lock;
      outputHashes = {
        "xcb-imdkit-0.3.0" = "sha256-fTpJ6uNhjmCWv7dZqVgYuS2Uic36XNYTbqlaly5QBjI=";
        "sqlite-cache-0.1.3" = "sha256-sBAC8MsQZgH+dcWpoxzq9iw5078vwzCijgyQnMOWIkk=";
      };
    };
    date = "2024-05-10";
  };
}
