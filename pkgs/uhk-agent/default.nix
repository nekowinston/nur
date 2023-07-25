{
  appimageTools,
  callPackage,
  lib,
  makeWrapper,
}: let
  nvfetcher = (callPackage ../../_sources/generated.nix {}).uhk-agent;
  pname = "uhk-agent";

  appimageContents = appimageTools.extractType2 {
    inherit pname;
    inherit (nvfetcher) src version;
  };

  meta = with lib; {
    description = "Ultimate Hacking Keyboard configurator";
    homepage = "https://ultimatehackingkeyboard.github.io/agent/";
    license = licenses.unfree;
    platforms = platforms.linux;
  };
in
  appimageTools.wrapType2 rec {
    inherit pname meta;
    inherit (nvfetcher) version src;
    name = "${pname}-${version}";

    extraInstallCommands = ''
      mv $out/bin/{${name},${pname}}

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
