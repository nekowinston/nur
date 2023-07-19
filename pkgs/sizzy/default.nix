{
  appimageTools,
  callPackage,
  lib,
  stdenvNoCC,
  undmg,
}: let
  nvfetcher = callPackage ../../_sources/generated.nix {};
  pname = "sizzy";

  appimageContents = appimageTools.extractType2 {
    inherit pname;
    inherit (nvfetcher.sizzy-linux) src version;
  };

  meta = with lib; {
    description = "The browser for web developers";
    homepage = "https://sizzy.co";
    license = licenses.unfree;
    platforms = platforms.unix;
  };

  darwinBuilder = arch: let
    source = nvfetcher.${"sizzy-darwin-" + arch};
  in
    stdenvNoCC.mkDerivation {
      inherit pname meta;
      inherit (source) version;

      src = source.src.overrideAttrs (_: {name = "Sizzy.dmg";});
      buildInputs = [undmg];
      sourceRoot = ".";

      installPhase = ''
        mkdir -p $out/Applications
        mv Sizzy.app $out/Applications
      '';
    };
in
  {
    aarch64-linux = throw "Unsupported platform ${stdenvNoCC.hostPlatform.system}";
    x86_64-linux = appimageTools.wrapType2 rec {
      inherit pname meta;
      inherit (nvfetcher.sizzy-linux) version src;
      name = "${pname}-${version}";

      extraInstallCommands = ''
        mv $out/bin/${name} $out/bin/${pname}
        install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications/${pname}.desktop

        for size in 16 32 48 64 128 256 512; do
          install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/''${size}x''${size}/apps/${pname}.png $out/share/icons/hicolor/''${size}x''${size}/apps/${pname}.png
        done

        substituteInPlace $out/share/applications/${pname}.desktop \
          --replace 'Exec=AppRun --no-sandbox %U' 'Exec=${pname}'
      '';
    };

    aarch64-darwin = darwinBuilder "arm";
    x86_64-darwin = darwinBuilder "x64";
  }
  .${stdenvNoCC.hostPlatform.system}
  or (throw "Unsupported platform ${stdenvNoCC.hostPlatform.system}")
