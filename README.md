# nekowinston/nur

[![Build and populate cache](https://github.com/nekowinston/nur/actions/workflows/build.yml/badge.svg)](https://github.com/nekowinston/nur/actions/workflows/build.yml)
[![Cachix Cache](https://img.shields.io/badge/cachix-nekowinston-blue.svg)](https://nekowinston.cachix.org)

## What's available

| General Packages                                                             | Note                                  | Version    |
| ---------------------------------------------------------------------------- | ------------------------------------- | ---------- |
| [`cura`][cura]                                                               | AppImage wrapper                      | 5.2.2      |
| ~~[`discord-applemusic-rich-presence`][darp]~~                               | moved to [caarlos0/nur][caarlos0nur]! | 0.5.0      |
| [`discover-overlay`][discover]                                               |                                       | 0.6.3      |
| [`helm-ls`][helm-ls]                                                         |                                       | 2022-09-21 |
| [`jq-lsp`][jq-lsp]                                                           |                                       | 2022-12-20 |
| [`mopidy-podcast-itunes`][mopidy-pi]                                         |                                       | 2022-04-03 |
| ~~[`org-stats`][org-stats]~~                                                 | moved to [caarlos0/nur][caarlos0nur]! | 1.11.2     |
| [`picom-ft-labs`][picom]                                                     | FT-Labs fork                          | 2023-02-06 |
| [`vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools`][k8s-tools] | VSCode extension                      | 1.3.11     |
| [`wezterm`][wezterm]                                                         | nightly builds                        | git        |

| Catppuccin Packages                     | Note                             | Version    |
| --------------------------------------- | -------------------------------- | ---------- |
| [`papirus-folders-catppuccin`][papirus] | [Credit to @rubyowo][papirus-pr] | 2022-12-03 |
| [`plymouth-theme-catppuccin`][plymouth] |                                  | 2022-12-10 |

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
      # ... your other overlays
    };
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

[cura]: https://ultimaker.com/software/ultimaker-cura
[caarlos0nur]: https://github.com/caarlos0/nur
[darp]: https://github.com/caarlos0/discord-applemusic-rich-presence
[discover]: https://github.com/trigg/Discover
[helm-ls]: https://github.com/mrjosh/helm-ls
[jq-lsp]: https://github.com/wader/jq-lsp
[k8s-tools]: https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools
[mopidy-pi]: https://github.com/tkem/mopidy-podcast-itunes
[org-stats]: https://github.com/caarlos0/org-stats
[papirus]: https://github.com/catppuccin/papirus-folders
[papirus-pr]: https://github.com/NixOS/nixpkgs/pull/207211
[picom]: https://github.com/FT-Labs/picom
[plymouth]: https://github.com/catppuccin/plymouth
[wezterm]: https://github.com/wez/wezterm
