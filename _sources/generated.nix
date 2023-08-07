# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  apple-emoji = {
    pname = "apple-emoji";
    version = "v16.4";
    src = fetchurl {
      url = "https://github.com/samuelngs/apple-emoji-linux/releases/download/v16.4/AppleColorEmoji.ttf";
      sha256 = "sha256-goY9lWBtOnOUotitjVfe96zdmjYTPT6PVOnZ0MEWh0U=";
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
    version = "0.6.5";
    src = fetchurl {
      url = "https://pypi.org/packages/source/d/discover-overlay/discover-overlay-0.6.5.tar.gz";
      sha256 = "sha256-o20Q+3VF60khXuvh4RmHkyt25cK7y9Svr+1NqsZ0o9s=";
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
    version = "c449b71b56de1ced375a64a986381cf70cec3080";
    src = fetchFromGitHub {
      owner = "nomic-ai";
      repo = "gpt4all";
      rev = "c449b71b56de1ced375a64a986381cf70cec3080";
      fetchSubmodules = true;
      sha256 = "sha256-AsWbCOCBs/A87c6S00NoIj1AbdN5RjZlCxzqhaY+Hjk=";
    };
    date = "2023-08-02";
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
      sha256 = "sha256-7mk4i36CWPy08RdNTuFyahL3gb6HL7wwjWS9Zs1LH6s=";
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
      sha256 = "sha256-XoTegyl5BTBPHrKfaxJ18U2mzzxqCXLS9yUtN0hcB7I=";
    };
  };
  sizzy-darwin-arm = {
    pname = "sizzy-darwin-arm";
    version = "71.5.0";
    src = fetchurl {
      url = "https://proxy.sizzy.co/updates/download/mac?arch=arm64";
      sha256 = "sha256-SA0RzCU9Kp6Fj1l3uZewc+JxEkwDi8cjgWlqgQqMVQw=";
    };
  };
  sizzy-darwin-x64 = {
    pname = "sizzy-darwin-x64";
    version = "71.5.0";
    src = fetchurl {
      url = "https://proxy.sizzy.co/updates/download/mac?arch=x64";
      sha256 = "sha256-j/xzsEoMn3/r2Q1zw9MMiGGiTM/r2v4yELfOoIFPp60=";
    };
  };
  sizzy-linux = {
    pname = "sizzy-linux";
    version = "71.5.0";
    src = fetchurl {
      url = "https://proxy.sizzy.co/updates/download/linux?arch=x64";
      sha256 = "sha256-ygXw4P241umCG/3ml4rQpNgFkYUUALEXwH53wtUQIgY=";
    };
  };
  uhk-agent = {
    pname = "uhk-agent";
    version = "3.0.1";
    src = fetchurl {
      url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v3.0.1/UHK.Agent-3.0.1-linux-x86_64.AppImage";
      sha256 = "sha256-TX7mL6BWAZHZ2W9/BneOt1vxt2slC2Lv6eFWPAgS2a8=";
    };
  };
  wezterm = {
    pname = "wezterm";
    version = "bf1726343131f0dae4eb5d2dd7e6b15e3e6754fc";
    src = fetchFromGitHub {
      owner = "wez";
      repo = "wezterm";
      rev = "bf1726343131f0dae4eb5d2dd7e6b15e3e6754fc";
      fetchSubmodules = true;
      sha256 = "sha256-sG7uj2qnSzwLLKc/S92exRd5k/g2JLzHumCJQEvnsW0=";
    };
    date = "2023-08-06";
  };
}
