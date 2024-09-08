{
  appimageTools,
  callPackage,
  lib,
}:
let
  nvfetcher = (callPackage ../../_sources/generated.nix { }).cura;
  inherit (nvfetcher) pname version src;
  name = "${pname}-${version}";

  appimageContents = appimageTools.extractType1 { inherit name src; };
in
appimageTools.wrapType2 {
  name = "cura";
  inherit version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/com.ultimaker.cura.desktop $out/share/applications/${pname}.desktop
    install -m 444 -D ${appimageContents}/cura-icon.png $out/share/icons/hicolor/256x256/apps/${pname}.png

    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Icon=cura-icon' 'Icon=${pname}' \
      --replace-fail 'Exec=UltiMaker-Cura' 'Exec=${pname}'
  '';

  passthru = {
    inherit appimageContents;
  };

  meta = {
    mainProgram = "cura";
    description = "3D printer / slicing GUI built on top of the Uranium framework ";
    homepage = "https://github.com/Ultimaker/Cura";
    license = lib.licenses.lgpl3;
    platforms = lib.platforms.linux;
  };
}
