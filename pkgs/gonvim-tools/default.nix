{pkgs}: let
  nurPkgs =
    builtins.mapAttrs (name: content:
      pkgs.buildGoModule (rec {
          inherit name;
          src = (import ../../npins).${name};
        }
        // content))
    {
      go-enum = {
        vendorHash = "sha256-+iQCOUg7rGfOgNvmj+lMLYb4A749hDK/3hexEw9IRmI=";
      };
      gomvp = {
        vendorHash = null;
      };
      json-to-struct = {
        vendorHash = "sha256-XeqElLWCHqQxWNrbFGB9nBekG9uWDmv1AkGIoHfX1Co=";
      };
    };
in
  pkgs.symlinkJoin {
    name = "gonvim-tools";
    paths = with pkgs; [
      delve
      ginkgo
      gofumpt
      golangci-lint
      golines
      gomodifytags
      gopls
      gotests
      gotestsum
      gotools
      govulncheck
      iferr
      impl
      mockgen
      nurPkgs.go-enum
      nurPkgs.gomvp
      nurPkgs.json-to-struct
      reftools
      richgo
    ];
  }
