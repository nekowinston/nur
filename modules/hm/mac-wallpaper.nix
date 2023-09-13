{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.home.mac-wallpaper;
in {
  options.home.mac-wallpaper = mkOption {
    type = types.nullOr types.path;
    default = null;
    example = "/Users/winston/Pictures/Wallpapers/wallpaper.png";
    description = "Path to the wallpaper to set.";
  };

  config =
    mkIf (cfg != null && pkgs.stdenv.isDarwin)
    {
      home.activation.set-wallpaper = let
        killall = "${pkgs.killall}/bin/killall";
        sqlite = "${pkgs.sqlite}/bin/sqlite3";
      in
        lib.hm.dag.entryAfter ["writeBoundary"] ''
          dpdb="$HOME/Library/Application Support/Dock/desktoppicture.db"

          ${sqlite} "$dpdb" "insert into data values ('${cfg}');"
          new_entry=$(${sqlite} "$dpdb" "select max(rowid) from data;")
          pics=$(${sqlite} "$dpdb" "select rowid from pictures")

          ${sqlite} "$dpdb" "delete from preferences;"

          for pic in $pics; do
            ${sqlite} "$dpdb" "insert into preferences (key, data_id, picture_id) values(1, $new_entry, $pic)"
          done

          ${killall} Dock
        '';
    };
}
