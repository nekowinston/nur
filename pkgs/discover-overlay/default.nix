{
  callPackage,
  gobject-introspection,
  gtk-layer-shell,
  gtk3,
  lib,
  python3Packages,
  wrapGAppsHook,
}: let
  nvfetcher = (callPackage ../../_sources/generated.nix {}).discover-overlay;
in
  python3Packages.buildPythonApplication {
    inherit (nvfetcher) pname version src;

    nativeBuildInputs = [
      wrapGAppsHook
      gobject-introspection
    ];
    propagatedBuildInputs = with python3Packages; [
      gobject-introspection
      gtk-layer-shell
      gtk3
      pillow
      pygobject3
      pyxdg
      requests
      setuptools
      websocket-client
      xlib
    ];

    doCheck = false;

    meta = with lib; {
      description = "Yet another discord overlay for linux";
      homepage = "https://github.com/trigg/Discover";
      license = licenses.gpl3;
      platforms = platforms.linux;
    };
  }
