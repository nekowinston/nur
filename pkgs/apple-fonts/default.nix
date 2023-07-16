{
  callPackage,
  lib,
  p7zip,
  stdenvNoCC,
  undmg,
  variants ? ["compact" "mono" "pro"],
}: let
  inherit (callPackage ../../_sources/generated.nix {}) sf-compact sf-mono sf-pro;
  srcs = {
    compact = sf-compact.src;
    mono = sf-mono.src;
    pro = sf-pro.src;
  };

  validVariants = ["compact" "mono" "pro"];
  pname = "apple-fonts";
in
  lib.checkListOfEnum "${pname}: variants" validVariants variants
  stdenvNoCC.mkDerivation {
    inherit pname;
    name = pname;

    srcs = lib.attrVals variants srcs;

    buildInputs = [p7zip undmg];

    unpackPhase = ''
      for f in $srcs; do
        7z x -y $f
        7z x -y "*/*.pkg"
        7z x -y "Payload~"
      done
    '';

    installPhase = ''
      for f in Library/Fonts/*.otf; do
        echo $(basename $f)
        install -D -m644 "$f" "$out/share/fonts/opentype/$(basename $f)"
      done
    '';

    meta = with lib; {
      description = "Apple SF fonts";
      homepage = "https://developer.apple.com/fonts/";
      license = licenses.unfree;
      platforms = platforms.unix;
    };
  }
