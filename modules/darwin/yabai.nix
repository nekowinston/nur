{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.yabai;

  toYabaiConfig = opts:
    concatStringsSep "\n" (mapAttrsToList
      (p: v: "yabai -m config ${p} ${toString v}")
      opts);

  configFile = pkgs.writeScript "yabairc" (
    optionalString cfg.enableScriptingAddition ''
      ${cfg.package}/bin/yabai -m signal --add event=dock_did_restart action="sudo ${cfg.package}/bin/yabai --load-sa"
      sudo ${cfg.package}/bin/yabai --load-sa
    ''
    + optionalString (cfg.config != {}) ("\n" + (toYabaiConfig cfg.config) + "\n")
    + optionalString (cfg.extraConfig != "") ("\n" + cfg.extraConfig + "\n")
  );
in {
  # overwrite the default nix-darwin module, as this fixes the Scripting Addition
  disabledModules = ["services/yabai"];

  options.services.yabai = {
    enable = mkEnableOption "yabai window manager";

    package = mkPackageOption pkgs "yabai" {};

    logFile = mkOption {
      type = types.str;
      default = "";
      example = literalExpression "/var/tmp/yabai.log";
      description = "Path where you want to write daemon logs.";
    };

    enableScriptingAddition = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = ''
        Whether to enable yabai's scripting-addition.
        SIP must be (partially) disabled for this to work. See
        https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection

        Compared to Nix-Darwin's default module, this option also injects the necessary
        sha256 hash into the <literal>/etc/sudoers.d/yabai</literal> file.
      '';
    };

    config = mkOption {
      type = types.attrs;
      default = {};
      example = literalExpression ''
        {
          focus_follows_mouse = "autoraise";
          mouse_follows_focus = "off";
          window_placement    = "second_child";
          window_opacity      = "off";
          top_padding         = 36;
          bottom_padding      = 10;
          left_padding        = 10;
          right_padding       = 10;
          window_gap          = 10;
        }
      '';
      description = ''
        Key/Value pairs to pass to yabai's 'config' domain, via the configuration file.
      '';
    };
    extraConfig = mkOption {
      type = types.str;
      default = "";
      example = literalExpression ''
        yabai -m rule --add app='System Preferences' manage=off
      '';
      description = "Extra arbitrary configuration to append to the configuration file";
    };
  };

  config = mkIf cfg.enable (mkMerge [
    {
      environment.systemPackages = [cfg.package];
      launchd.user.agents.yabai.serviceConfig = rec {
        ProgramArguments = ["${cfg.package}/bin/yabai" "-c" "${configFile}"];
        KeepAlive = true;
        RunAtLoad = true;
        EnvironmentVariables.PATH = "${cfg.package}/bin:${config.environment.systemPath}";

        StandardOutPath = mkIf (cfg.logFile != "") "${cfg.logFile}";
        StandardErrorPath = StandardOutPath;
      };
    }
    (mkIf cfg.enableScriptingAddition {
      environment.etc."sudoers.d/yabai".text = let
        sha = builtins.hashFile "sha256" "${cfg.package}/bin/yabai";
      in "%admin ALL=(root) NOPASSWD: sha256:${sha} ${cfg.package}/bin/yabai --load-sa";
    })
  ]);
}
