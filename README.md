# nekowinston/nur

[![Build and populate cache](https://github.com/nekowinston/nur/actions/workflows/build.yml/badge.svg)](https://github.com/nekowinston/nur/actions/workflows/build.yml)
[![Cachix Cache](https://img.shields.io/badge/cachix-nekowinston-blue.svg)](https://<YOUR_CACHIX_CACHE_NAME>.cachix.org)

## What's available

| Package                                                                      | Note             |
| ---------------------------------------------------------------------------- | ---------------- |
| [`cura`][cura]                                                               | AppImage wrapper |
| [`discord-applemusic-rich-presence`][darp]                                   | macOS only       |
| [`discover-overlay`][discover]                                               |                  |
| [`helm-ls`][helm-ls]                                                         |                  |
| [`jq-lsp`][jq-lsp]                                                           |                  |
| [`mopidy-podcast-itunes`][mopidy-pi]                                         |                  |
| [`org-stats`][org-stats]                                                     |                  |
| [`papirus-folders-catppuccin`][papirus]                                      |                  |
| [`vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools`][k8s-tools] | VSCode extension |

| Overlay          | Note         |
| ---------------- | ------------ |
| [`picom`][picom] | FT-Labs fork |

[cura]: https://ultimaker.com/software/ultimaker-cura
[darp]: https://github.com/caarlos0/discord-applemusic-rich-presence
[discover]: https://github.com/trigg/Discover
[helm-ls]: https://github.com/mrjosh/helm-ls
[jq-lsp]: https://github.com/wader/jq-lsp
[k8s-tools]: https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools
[mopidy-pi]: https://github.com/tkem/mopidy-podcast-itunes
[org-stats]: https://github.com/caarlos0/org-stats
[papirus]: https://github.com/catppuccin/papirus-folders
[picom]: https://github.com/FT-Labs/picom

## Usage

<!-- With `packageOverrides`: -->

With `overlays`:

```nix
{
  inputs = {
    nur.url = "github:nix-community/NUR";
    nekowinston-nur.url = "github:nekowinston/nur";
  };

  outputs = {
    self,
    nixpkgs,
    nur,
    nekowinston-nur,
    ...
  }: let
    overlays = final: prev: {
      nur = import nur {
        nurpkgs = prev;
        pkgs = prev;
        repoOverrides = {nekowinston = import nekowinston-nur {pkgs = prev;};};
      };
    };
    # ... your other overlays
  in {
    system = "x86_64-linux";

    modules = [
      ({config, ...}: {
        config = {
          nixpkgs.overlays = [
            overlays
          ];
        };
      })
    ];
  };
}
```
