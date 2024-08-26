{
  appimageTools,
  callPackage,
  lib,
  makeWrapper,
  stdenvNoCC,
  undmg,
}:
let
  nvfetcher = callPackage ../../_sources/generated.nix { };
  pname = "sizzy";

  appimageContents = appimageTools.extractType2 {
    inherit pname;
    inherit (nvfetcher.sizzy-linux) src version;
  };

  meta = with lib; {
    description = "The browser for web developers";
    homepage = "https://sizzy.co";
    license = licenses.unfree;
    platforms = [
      "aarch64-darwin"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };

  darwinBuilder =
    arch:
    let
      source = nvfetcher.${"sizzy-darwin-" + arch};
    in
    stdenvNoCC.mkDerivation {
      inherit pname meta;
      inherit (source) version;

      src = source.src.overrideAttrs (_: {
        name = "Sizzy.dmg";
      });
      buildInputs = [ undmg ];
      sourceRoot = ".";

      installPhase = ''
        mkdir -p $out/Applications
        mv Sizzy.app $out/Applications
      '';
    };
in
if stdenvNoCC.isDarwin then
  darwinBuilder (
    if stdenvNoCC.isAarch64 then
      "arm"
    else if stdenvNoCC.isx86_64 then
      "x64"
    else
      (throw "${pname}: ${stdenvNoCC.system} is unsupported.")
  )
else
  appimageTools.wrapType2 {
    inherit pname meta;
    inherit (nvfetcher.sizzy-linux) version src;

    extraInstallCommands = ''
      source "${makeWrapper}/nix-support/setup-hook"
      wrapProgram $out/bin/${pname} \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"

      install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications/${pname}.desktop
      for size in 16 32 48 64 128 256 512; do
        install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/''${size}x''${size}/apps/${pname}.png $out/share/icons/hicolor/''${size}x''${size}/apps/${pname}.png
      done

      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun --no-sandbox %U' 'Exec=${pname}'
    '';
  }
