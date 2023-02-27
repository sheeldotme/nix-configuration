build:
  nix --experimental-features 'nix-command flakes' build .#darwinConfigurations.malmo.system && result/sw/bin/darwin-rebuild switch --flake ~/.config/nixpkgs
