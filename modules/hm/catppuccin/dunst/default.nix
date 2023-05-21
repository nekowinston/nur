{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  global = config.catppuccin;
  cfg = config.catppuccin.btop;
  fromINI = f: let
    iniFile = pkgs.runCommand "convertini" {
      nativeBuildInputs = [pkgs.jc];
    } ''jc --ini < ${f} > "$out" '';
  in
    builtins.fromJSON (builtins.readFile iniFile);
  dunstSettings = fromINI (pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "dunst";
      rev = "a72991e56338289a9fce941b5df9f0509d2cba09";
      sha256 = "sha256-1LeSKuZcuWr9z6mKnyt1ojFOnIiTupwspGrOw/ts8Yk=";
    }
    + "/src/mocha.conf");
in {
  options.catppuccin.dunst = {
    enable = mkEnableOption {
      type = types.bool;
      default = false;
      description = "Enable catppuccin dunst theme";
    };
    theme = mkOption {
      type = types.enum ["mocha" "macchiato" "frappe" "latte"];
      default = global.defaultTheme;
      description = "Choose a catppuccin dunst theme";
    };
  };

  config = mkIf cfg.enable {
    services.dunst = {
      enable = true;
      settings = lib.mkMerge dunstSettings;
    };
  };
}
