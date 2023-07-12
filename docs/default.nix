{
  pkgs,
  lib,
}: let
  nmdSrc = fetchTarball {
    url = "https://git.sr.ht/~rycee/nmd/archive/824a380546b5d0d0eb701ff8cd5dbafb360750ff.tar.gz";
    sha256 = "0vvj40k6bw8ssra8wil9rqbsznmfy1kwy7cihvm13rajwdg9ycgg";
  };

  nmd = import nmdSrc {inherit lib pkgs;};

  setupModule = {
    imports = [
      {
        _module.args = {
          pkgs = lib.mkForce (nmd.scrubDerivations "pkgs" pkgs);
          pkgs_i686 = lib.mkForce {};
        };
        _module.check = false;
      }
    ];
  };

  darwinModulesDocs = nmd.buildModulesDocs {
    modules = [
      ../modules/darwin
      setupModule
    ];
    moduleRootPaths = [../modules/darwin];
    mkModuleUrl = path: "https://github.com/nekowinston/nur/blob/master/modules/darwin/${path}";
    channelName = "nekowinston-nur";
    docBook = {
      id = "nekowinston-nur-darwin-options";

      optionIdPrefix = "darwin-opt";
    };
  };

  hmModulesDocs = nmd.buildModulesDocs {
    modules = [
      ../modules/hm
      setupModule
    ];
    moduleRootPaths = [../modules/hm];
    mkModuleUrl = path: "https://github.com/nekowinston/nur/blob/master/modules/hm/${path}";
    channelName = "nekowinston-nur";
    docBook = {
      id = "nekowinston-nur-hm-options";
      optionIdPrefix = "hm-opt";
    };
  };

  docs = nmd.buildDocBookDocs {
    pathName = "nekowinston-nur";
    modulesDocs = [
      darwinModulesDocs
      hmModulesDocs
    ];
    documentsDirectory = ./.;
    chunkToc = ''
      <toc>
        <d:tocentry xmlns:d="http://docbook.org/ns/docbook" linkend="nekowinston-nur-manual">
          <?dbhtml filename="index.html"?>
          <d:tocentry linkend="ch-darwin-options">
            <?dbhtml filename="darwin-options.html"?>
          </d:tocentry>
          <d:tocentry linkend="ch-hm-options">
            <?dbhtml filename="hm-options.html"?>
          </d:tocentry>
        </d:tocentry>
      </toc>
    '';
  };
in {inherit (docs) html htmlOpenTool;}
