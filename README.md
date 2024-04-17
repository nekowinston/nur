# nekowinston/nur

[![Build and populate cache](https://github.com/nekowinston/nur/actions/workflows/build.yml/badge.svg)](https://github.com/nekowinston/nur/actions/workflows/build.yml)
[![Cachix Cache](https://img.shields.io/badge/cachix-nekowinston-blue.svg)](https://nekowinston.cachix.org)

## What's available

| General Packages                      | Note                                                 | Version      |
| ------------------------------------  | ----------------                                     | ----------   |
| [`apple-cursor`][apple-cursor]        |                                                      | 2.0.0        |
| [`cura`][cura]                        | AppImage wrapper                                     | 5.4.0        |
| [`discover-overlay`][discover]        |                                                      | 0.6.5        |
| `gonvim-tools`                        | convenience wrapper for [ray-x/go.nvim][gonvim] deps | meta-package |
| [`helm-ls`][helm-ls]                  |                                                      | 2022-09-21   |
| [`icat`][icat]                        |                                                      | git          |
| [`jq-lsp`][jq-lsp]                    |                                                      | 2022-12-20   |
| [`mopidy-podcast-itunes`][mopidy-pi]  |                                                      | 2022-04-03   |
| [`posy-improved-cursor`][posy-cursor] |                                                      | 2022-09-14   |
| [`wezterm`][wezterm]                  | nightly builds                                       | git          |

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

[apple-cursor]: https://github.com/ful1e5/apple_cursor
[caarlos0nur]: https://github.com/caarlos0/nur
[cura]: https://ultimaker.com/software/ultimaker-cura
[darp]: https://github.com/caarlos0/discord-applemusic-rich-presence
[discover]: https://github.com/trigg/Discover
[gonvim]: https://github.com/ray-x/go.nvim
[helm-ls]: https://github.com/mrjosh/helm-ls
[icat]: https://github.com/nekowinston/icat
[jq-lsp]: https://github.com/wader/jq-lsp
[mopidy-pi]: https://github.com/tkem/mopidy-podcast-itunes
[org-stats]: https://github.com/caarlos0/org-stats
[posy-cursor]: https://github.com/simtrami/posy-improved-cursor-linux
[wezterm]: https://github.com/wez/wezterm
