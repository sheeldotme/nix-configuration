local_path := "$HOME/.config/nixpkgs"

build:
  gh auth login
  if cd {{local_path}}; then git pull; else gh repo clone nix-configuration {{local_path}}; fi
  nix --experimental-features 'nix-command flakes' build {{local_path}}# && result/sw/bin/darwin-rebuild switch --flake {{local_path}}
