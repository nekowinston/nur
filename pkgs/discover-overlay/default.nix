{
  fetchFromGitHub,
  gobject-introspection,
  gtk-layer-shell,
  gtk3,
  lib,
  python3Packages,
  wrapGAppsHook,
}:
python3Packages.buildPythonApplication {
  pname = "discover-overlay";
  version = "2023.05.13";

  src = fetchFromGitHub {
    repo = "Discover";
    owner = "trigg";
    rev = "f7058f717152f13a56303cc472d7d7e646bdf915";
    sha256 = "sha256-YXxOh28YSBXPUt1OR9bhuglxQHPx5JsHDbX1CqIyQqg=";
  };

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
    homepage = "https://github.com/trigg/Discover";
    description = "Yet another discord overlay for linux";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
