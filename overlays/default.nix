final: prev: {
  catppuccin-gtk = prev.catppuccin-gtk.overrideAttrs (final: let
    nvfetcher = prev.callPackage ../../_sources/generated.nix {}.catppuccin-gtk;
  in {
    inherit (nvfetcher) src version;
  });
}
