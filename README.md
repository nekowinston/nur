# nekowinston/nur

[![Build and populate cache](https://github.com/nekowinston/nur/actions/workflows/build.yml/badge.svg)](https://github.com/nekowinston/nur/actions/workflows/build.yml)
[![Cachix Cache](https://img.shields.io/badge/cachix-nekowinston-blue.svg)](https://nekowinston.cachix.org)

## What's available

| General Packages                     | Note             | Version    |
| ------------------------------------ | ---------------- | ---------- |
| [`cura`][cura]                       | AppImage wrapper | 5.2.2      |
| [`discover-overlay`][discover]       |                  | 0.6.3      |
| [`helm-ls`][helm-ls]                 |                  | 2022-09-21 |
| [`jq-lsp`][jq-lsp]                   |                  | 2022-12-20 |
| [`mopidy-podcast-itunes`][mopidy-pi] |                  | 2022-04-03 |
| [`picom-ft-labs`][picom]             | FT-Labs fork     | 2023-02-06 |
| [`wezterm`][wezterm]                 | nightly builds   | git        |

| Catppuccin Packages                         | Note    | Version    |
| ------------------------------------------- | ------- | ---------- |
| [`catppuccin-gtk`][ctp-gtk]                 | Overlay | v0.6.0     |
| [`plymouth-theme-catppuccin`][ctp-plymouth] |         | 2022-12-10 |

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
    overlays = [
      # nur overlay
      (final: prev: {
        nur = import nur {
          nurpkgs = prev;
          pkgs = prev;
          repoOverrides = {
            # other repo overrides
            nekowinston = nekowinston-nur.packages.${prev.system};
          };
        };
      })
      # my overlays
      nekowinston.nur.overlays.default
    ];
  in {
    system = "x86_64-linux";

    modules = [
      ({config, ...}: {
        config = {
          nixpkgs.overlays = [overlays];
        };
      })
    ];
  };
}
```

[caarlos0nur]: https://github.com/caarlos0/nur
[ctp-gtk]: https://github.com/catppuccin/gtk
[ctp-plymouth]: https://github.com/catppuccin/plymouth
[cura]: https://ultimaker.com/software/ultimaker-cura
[darp]: https://github.com/caarlos0/discord-applemusic-rich-presence
[discover]: https://github.com/trigg/Discover
[helm-ls]: https://github.com/mrjosh/helm-ls
[jq-lsp]: https://github.com/wader/jq-lsp
[mopidy-pi]: https://github.com/tkem/mopidy-podcast-itunes
[org-stats]: https://github.com/caarlos0/org-stats
[picom]: https://github.com/FT-Labs/picom
[wezterm]: https://github.com/wez/wezterm
