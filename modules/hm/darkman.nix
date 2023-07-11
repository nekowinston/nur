{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) types;

  cfg = config.services.darkman;
  configModule = types.submodule {
    options = {
      lat = lib.mkOption {
        type = types.nullOr types.float;
        default = null;
        description = "Latitude to use for geoclue.";
      };
      lng = lib.mkOption {
        type = types.nullOr types.float;
        default = null;
        description = "Longitude to use for geoclue.";
      };
      useGeoclue = lib.mkOption {
        type = types.bool;
        default = true;
        description = "Whether to use a local geoclue instance to determine the current location. On some distributions/setups, this may require setting up a geoclue agent to function properly. The default for this will change to false in v2.0.";
      };
      useDbus = lib.mkOption {
        type = types.bool;
        default = true;
        description = "Whether to expose the current mode via darkman's own D-Bus API. The command line tool uses this API to apply changes, so it will not work if this setting is disabled. ";
      };
      portal = lib.mkOption {
        type = types.bool;
        default = true;
        description = "Whether to use the portal for communication.";
      };
    };
  };
in {
  options.services.darkman = {
    enable = lib.mkEnableOption "darkman";
    package = lib.mkPackageOption pkgs "darkman" {};
    config = lib.mkOption {
      type = configModule;
      default = {};
      description = "Config for darkman.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [cfg.package];
    systemd.user.services.darkman = {
      Unit = {
        Description = "Framework for dark-mode and light-mode transitions.";
        Documentation = ["man:darkman(1)"];
      };
      Service = {
        Type = "dbus";
        BusName = "nl.whynothugo.darkman";
        ExecStart = "${lib.getExe cfg.package} run";
        Restart = "on-failure";
        TimeoutStopSec = 15;
        Slice = "background.slice";
        # Security hardening
        LockPersonality = "yes";
        RestrictNamespaces = "yes";
        SystemCallArchitectures = "native";
        SystemCallFilter = "@system-service @timer mincore";
        MemoryDenyWriteExecute = "yes";
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
  };
}
