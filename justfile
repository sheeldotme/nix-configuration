local_path := "$HOME/.config/nixpkgs"

build:
  nix --experimental-features 'nix-command flakes' build {{local_path}}# && result/sw/bin/darwin-rebuild switch --flake {{local_path}}
