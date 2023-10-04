{pkgs}: let
  inherit (pkgs) lib;

  mkEval = module:
    lib.evalModules {
      modules = [
        module
        {
          _module = {
            pkgs = lib.mkForce (lib.scrubDerivations "pkgs" pkgs);
            check = false;
          };
        }
      ];
      specialArgs = {inherit pkgs;};
    };

  css = builtins.fetchurl {
    url = "https://gist.githubusercontent.com/nekowinston/51c71f831b89c3797bb2254e166c25b9/raw/7a7cb0217b44c72f14d38da1ebd15584102220da/pandoc.css";
    sha256 = "sha256:1hkbm8l3s3il5i409a6mafm8n2x48ly1jyn0m0h07l23rmrv7p89";
  };

  mkDoc = name: options: let
    doc = pkgs.nixosOptionsDoc {
      options = lib.filterAttrs (n: _: n != "_module") options;
      transformOptions = opt:
        opt
        // {
          declarations =
            map
            (decl:
              if lib.hasPrefix (toString ../.) (toString decl)
              then let
                subpath = lib.removePrefix "/" (lib.removePrefix (toString ../.) (toString decl));
              in {
                url = "https://github.com/nekowinston/nur/tree/master/${subpath}";
                name = subpath;
              }
              else decl)
            opt.declarations;
        };
    };
  in
    pkgs.runCommand "${name}-module-doc.md" {} ''
      cat >$out <<EOF
      # ${name} module options
      EOF

      cat ${doc.optionsCommonMark} >> $out
    '';
  convert = md:
    pkgs.runCommand "nekowinston-nur.html" {nativeBuildInputs = with pkgs; [pandoc texinfo];} ''
      mkdir $out
      cp ${css} style.css
      # pandoc --css="pandoc.css" --to=html5 -s -f markdown+smart --metadata pagetitle="Nekowinston-nur options" -o $out/index.html ${builtins.concatStringsSep " " md}
      pandoc -o file.texi ${builtins.concatStringsSep " " md}
      texi2any ./file.texi --html --split=chapter --css-include=./style.css --document-language=en -o $out
    '';
  nixosEval = mkEval (import ../modules/nixos);
  darwinEval = mkEval (import ../modules/darwin);
  hmEval = mkEval (import ../modules/hm);
  nixos = mkDoc "nixos" nixosEval.options;
  darwin = mkDoc "darwin" darwinEval.options;
  hm = mkDoc "home-manager" hmEval.options;
in {
  html = convert [nixos darwin hm];
  md = pkgs.linkFarm "md" (lib.mapAttrsToList (name: path: {inherit name path;}) ["nixos" "darwin" "hm"]);
}
