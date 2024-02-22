update:
  #!/usr/bin/env nix-shell
  #!nix-shell -i bash -p nvfetcher
  nvfetcher
  nvfetcher -c nvfetcher-go.toml -o _sources_go/
