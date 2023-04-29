{
  rustPlatform,
  lib,
  fetchFromGitHub,
  pkgs,
}: let
  inherit (pkgs) fontconfig installShellFiles lib libGL libiconv libxkbcommon ncurses nixosTests openssl perl pkg-config python3 runCommand stdenv vulkan-loader wayland zlib;
  inherit (pkgs.xorg) libX11 libxcb xcbutil xcbutilimage xcbutilkeysyms xcbutilwm;
  inherit (pkgs.darwin.apple_sdk.frameworks) CoreGraphics Cocoa Foundation UserNotifications;
in
  rustPlatform.buildRustPackage rec {
    pname = "wezterm";
    version = builtins.substring 0 7 src.rev;
    name = "${pname}-${version}";

    src = fetchFromGitHub {
      owner = "wez";
      repo = pname;
      rev = "9bc7de70eafcafca6e6e5cf21879f6e964c21448";
      fetchSubmodules = true;
      sha256 = "sha256-DcABoNM7N89izrYjtZjdcjhQKM2L8PNZCruWE5bbq3k=";
    };
    postPatch = ''
      echo ${version} > .tag

      # tests are failing with: Unable to exchange encryption keys
      rm -r wezterm-ssh/tests
    '';

    cargoLock = {
      lockFile = "${src}/Cargo.lock";
      outputHashes = {
        "image-0.24.5" = "sha256-fTajVwm88OInqCPZerWcSAm1ga46ansQ3EzAmbT58Js=";
        "xcb-imdkit-0.2.0" = "sha256-QOT9HLlA26DVPUF4ViKH2ckexUsu45KZMdJwoUhW+hA=";
      };
    };

    nativeBuildInputs =
      [
        installShellFiles
        ncurses # tic for terminfo
        pkg-config
        python3
      ]
      ++ lib.optional stdenv.isDarwin perl;

    buildInputs =
      [
        fontconfig
        zlib
      ]
      ++ lib.optionals stdenv.isLinux [
        libX11
        libxcb
        libxkbcommon
        openssl
        wayland
        xcbutil
        xcbutilimage
        xcbutilkeysyms
        xcbutilwm # contains xcb-ewmh among others
      ]
      ++ lib.optionals stdenv.isDarwin [
        Cocoa
        CoreGraphics
        Foundation
        libiconv
        UserNotifications
      ];

    buildFeatures = ["distro-defaults"];

    postInstall = ''
      mkdir -p $out/nix-support
      echo "${passthru.terminfo}" >> $out/nix-support/propagated-user-env-packages

      install -Dm644 assets/icon/terminal.png $out/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png
      install -Dm644 assets/wezterm.desktop $out/share/applications/org.wezfurlong.wezterm.desktop
      install -Dm644 assets/wezterm.appdata.xml $out/share/metainfo/org.wezfurlong.wezterm.appdata.xml

      install -Dm644 assets/shell-integration/wezterm.sh -t $out/etc/profile.d
      installShellCompletion --cmd wezterm \
        --bash assets/shell-completion/bash \
        --fish assets/shell-completion/fish \
        --zsh assets/shell-completion/zsh

      install -Dm644 assets/wezterm-nautilus.py -t $out/share/nautilus-python/extensions
    '';

    preFixup =
      lib.optionalString stdenv.isLinux ''
        patchelf \
          --add-needed "${libGL}/lib/libEGL.so.1" \
          --add-needed "${vulkan-loader}/lib/libvulkan.so.1" \
          $out/bin/wezterm-gui
      ''
      + lib.optionalString stdenv.isDarwin ''
        mkdir -p "$out/Applications"
        OUT_APP="$out/Applications/WezTerm.app"
        cp -r assets/macos/WezTerm.app "$OUT_APP"
        rm $OUT_APP/*.dylib
        cp -r assets/shell-integration/* "$OUT_APP"
        ln -s $out/bin/{wezterm,wezterm-mux-server,wezterm-gui,strip-ansi-escapes} "$OUT_APP"
      '';

    passthru = {
      tests = {
        all-terminfo = nixosTests.allTerminfo;
        terminal-emulators = nixosTests.terminal-emulators.wezterm;
      };
      terminfo =
        runCommand "wezterm-terminfo"
        {
          nativeBuildInputs = [ncurses];
        } ''
          mkdir -p $out/share/terminfo $out/nix-support
          tic -x -o $out/share/terminfo ${src}/termwiz/data/wezterm.terminfo
        '';
    };

    meta = with lib; {
      description = "GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust";
      homepage = "https://wezfurlong.org/wezterm";
      license = licenses.mit;
      maintainers = with maintainers; [SuperSandro2000 mimame];
    };
  }
