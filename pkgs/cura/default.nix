{
  appimageTools,
  fetchurl,
  lib,
}: let
  pname = "cura";
  version = "5.2.2";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://github.com/Ultimaker/Cura/releases/download/${version}/Ultimaker-Cura-${version}-linux-modern.AppImage";
    sha256 = "sha256-GTMRrGh+2NRtdkqcoDfjZgDjIVv9kZhFpU5+/wYWEuc=";
  };

  appimageContents = appimageTools.extractType1 {
    inherit name src;
  };
in
  appimageTools.wrapType1 rec {
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
