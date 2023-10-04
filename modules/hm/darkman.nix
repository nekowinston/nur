{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.darkman;

  configModule = types.submodule {
    options = {
      lat = mkOption {
        type = with types; nullOr float;
        default = null;
        description = ''
          Your current latitude, between `-90.0` and `90.0`
          Must be provided along with longitude.
        '';
      };
      lng = mkOption {
        type = with types; nullOr float;
        default = null;
        description = ''
          Your current longitude, between `-180.0` and
          `180.0` Must be provided along with
          latitude.
        '';
      };
      useGeoclue = mkOption {
        type = with types; nullOr bool;
        default = false;
        description = ''
          Whether to use a local geoclue instance to determine the current location.

          You must also enable the system-wide geoclue2 service on NixOS:
          `services.geoclue.enable = true;`
        '';
      };
      useDbus = mkOption {
        type = with types; nullOr bool;
        default = true;
        description = ''
          Whether to expose the current mode via darkman's own D-Bus API.
          The command line tool uses this API to apply changes, so it will not work if this setting is disabled.

          You will need to add `pkgs.darkman` to your
          NixOS `services.dbus.packages` for this to work.
        '';
      };
      portal = mkOption {
        type = with types; nullOr bool;
        default = true;
        description = ''
          Whether to use the portal for communication.

          You will need to add `pkgs.darkman` to your
          NixOS `xdg.portal.extraPortals` for this to work.
        '';
      };
    };
  };

  buildActivationDrv = {
    dark,
    light,
  }: let
    darkScript = pkgs.writeShellScript "darkman-activation-dark" dark;
    lightScript = pkgs.writeShellScript "darkman-activation-light" light;
  in
    pkgs.runCommand "darkman-activation" {} ''
      install -Dm755 ${darkScript}  $out/dark-mode.d/nix-hm-module-darkman.sh
      install -Dm755 ${lightScript} $out/light-mode.d/nix-hm-module-darkman.sh
    '';
in {
  options.services.darkman = {
    enable = mkEnableOption "darkman";
    package = mkPackageOption pkgs "darkman" {};
    config = mkOption {
      type = configModule;
      default = {};
      description = "Config for darkman.";
    };
    activationScript = let
      doc = mode: ''
        Commands to run when ${mode} mode is activated.

        The scripts are placed in a Nix derivation,
        `${mode}-mode.d/nix-hm-module-darkman.sh`, which is then added
        to `xdg.systemDirs.data` (`$XDG_DATA_DIRS`).
        The interpreter of these script is `pkgs.bash`, as they are
        created by `pkgs.writeShellScript`.
      '';
    in {
      dark = mkOption {
        type = types.str;
        default = "";
        description = doc "dark";
      };
      light = mkOption {
        type = types.str;
        default = "";
        description = doc "light";
      };
    };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
    {
      assertions = [
        (hm.assertions.assertPlatform "services.darkman" pkgs platforms.linux)
        {
          assertion = cfg.config.useGeoclue || (cfg.config.lat != null || cfg.config.lng != null);
          message = ''
            You're not using geoclue, and have not set a latitude and longitude.
            Please either enable geoclue, or set lat and lng to the coordinates of your location.
          '';
        }
      ];

      home.packages = [cfg.package];

      systemd.user.services.darkman = {
        Unit = {
          Description = "Framework for dark-mode and light-mode transitions.";
          Documentation = ["man:darkman(1)"];
        };
        Service = {
          Type = "dbus";
          BusName = "nl.whynothugo.darkman";
          ExecStart = "${cfg.package}/bin/darkman run";
          Restart = "on-failure";
          TimeoutStopSec = 15;
          Slice = "background.slice";
          # Security hardening
          LockPersonality = "yes";
          RestrictNamespaces = "yes";
          SystemCallArchitectures = "native";
          SystemCallFilter = "@system-service @timer mincore";
          MemoryDenyWriteExecute = "yes";
          Environment = "PATH=${lib.makeBinPath (with pkgs; [bash coreutils gnugrep gnused which])}";
        };
        Install.WantedBy = ["default.target"];
      };

      xdg.configFile."darkman/config.yaml".text = builtins.toJSON ({
          inherit (cfg.config) portal;
          dbusserver = cfg.config.useDbus;
          usegeoclue = cfg.config.useGeoclue;
        }
        // lib.optionalAttrs (cfg.config.lat != null && cfg.config.lng != null) {
          inherit (cfg.config) lat lng;
        });
    }
    (lib.mkIf (cfg.activationScript.dark != "" || cfg.activationScript.light != "") {
      xdg.systemDirs.data = [
        "${(buildActivationDrv {inherit (cfg.activationScript) dark light;})}"
      ];
    })
  ]);
}
