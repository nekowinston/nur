{
  appimageTools,
  callPackage,
  lib,
}: let
  nvfetcher = (callPackage ../../_sources/generated.nix {}).cura;
  inherit (nvfetcher) pname version src;
  name = "${pname}-${version}";

  appimageContents = appimageTools.extractType1 {
    inherit name src;
  };
in
  appimageTools.wrapType1 {
    inherit name version src;

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/cura.desktop $out/share/applications/${pname}.desktop
      install -m 444 -D ${appimageContents}/cura-icon.png $out/share/icons/hicolor/256x256/apps/${pname}.png

      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Icon=cura-icon' 'Icon=${pname}' \
        --replace 'Exec=UltiMaker-Cura' 'Exec=${pname}'
    '';

    meta = with lib; {
      description = "3D printer / slicing GUI built on top of the Uranium framework ";
      homepage = "https://github.com/Ultimaker/Cura";
      license = licenses.lgpl3;
      platforms = platforms.linux;
    };
  }
