{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  global = config.catppuccin;
  cfg = config.catppuccin.bat;

  themepkg = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "bat";
    rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
    sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
  };
in {
  options.catppuccin.bat = {
    enable = mkEnableOption {
      type = types.bool;
      default = false;
      description = "Enable catppuccin bat theme";
    };
    theme = mkOption {
      type = types.enum ["mocha" "macchiato" "frappe" "latte"];
      default = global.defaultTheme;
      description = "Choose a catppuccin bat theme";
    };
  };

  config = mkIf cfg.enable {
    programs.bat = {
      enable = true;
      config = {
        theme = "Catppuccin-${cfg.theme}";
      };
      themes = let
        getTheme = flavour:
          builtins.readFile (themepkg + "/Catppuccin-${flavour}.tmTheme");
      in
        builtins.mapAttrs (k: v: getTheme k) builtins.listToAttrs ["mocha" "macchiato" "frappe" "latte"];
    };
  };
}
