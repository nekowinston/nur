{
  callPackage,
  lib,
  python3Packages,
  mopidy,
  mopidy-podcast,
}: let
  nvfetcher = (callPackage ../../_sources/generated.nix {}).mopidy-podcast-itunes;
in
  python3Packages.buildPythonApplication {
    inherit (nvfetcher) pname version src;

    propagatedBuildInputs = with python3Packages; [
      mopidy
      mopidy-podcast
      cachetools
      responses
      uritools
    ];

    checkInputs = with python3Packages; [
      pytestCheckHook
    ];

    meta = with lib; {
      description = "Mopidy extension for searching and browsing podcasts on the Apple iTunes Store.";
      homepage = "https://github.com/tkem/mopidy-podcast-itunes";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  }
