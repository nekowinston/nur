{lib, ...}: let
  ctpLib = rec {
    catppuccinFlavors = lib.types.enum ["mocha" "macchiato" "frappe" "latte"];
    mkCatppuccinThemeOption = name:
      lib.mkOption {
        type = catppuccinFlavors;
        default = "mocha";
        description = "Choose a catppuccin ${name} theme";
      };
  };
in
  with lib; {
    imports = [
      ./bat
      ./btop
      # ./dunst
      ./dircolors
      ./k9s
      # ./lsd
      ./vscode
    ];

    options.catppuccin = {
      defaultTheme = mkOption {
        type = types.enum ["mocha" "macchiato" "frappe" "latte"];
        default = "mocha";
        description = "Choose a catppuccin theme";
      };
    };
  }
