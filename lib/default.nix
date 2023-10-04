{pkgs}:
with pkgs.lib; {
  scrubDerivations = prefixPath: attrs: let
    scrubDerivation = name: value: let
      pkgAttrName = prefixPath + "." + name;
    in
      if isAttrs value
      then
        scrubDerivations pkgAttrName value
        // optionalAttrs (isDerivation value) {
          outPath = "\${${pkgAttrName}}";
        }
      else value;
  in
    mapAttrs scrubDerivation attrs;
}
