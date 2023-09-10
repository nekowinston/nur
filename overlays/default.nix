final: prev: {
  catppuccin-gtk = prev.catppuccin-gtk.overrideAttrs (final: let
    nvfetcher = prev.callPackage ../../_sources/generated.nix {}.catppuccin-gtk;
  in {
    inherit (nvfetcher) src version;
  });
  yabai = prev.yabai.overrideAttrs (oldAttrs: let
    nvfetcher = prev.callPackage ../../_sources/generated.nix {};
    # the x86 build here uses the git fetch, aarch64 uses the release
    sources = {
      "aarch64-darwin" = nvfetcher.yabai-aarch64;
      "x86_64-darwin" = nvfetcher.yabai-x86_64;
    };
    # take the version from the git tags
    version = nvfetcher.yabai-x86_64.version;
  in {
    inherit version;
    src = sources."${prev.stdenv.hostPlatform.system}" or (throw "Unsupported platform");
  });
}
