{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:mic92/sops-nix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, darwin, home-manager, nixpkgs, sops-nix }: {
    darwinConfigurations.malmo = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ({ pkgs, ... }: {
          nix.useDaemon = true;
          programs.zsh.enable = true;
        })
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.sheelpatel = { pkgs, ...}: {
              home.stateVersion = "23.05";
              programs = {
                atuin = {
                  enable = true;
                  enableZshIntegration = true;
                };
                bat.enable = true;
                bottom.enable = true;
                direnv = {
                  enable = true;
                  enableZshIntegration = true;
                  nix-direnv.enable = true;
                };
                exa.enable = true;
                git = {
                  enable = true;
                  delta.enable = true;
                  userName = "Sheel Patel";
                  userEmail = "sheelpatel@me.com";
                };
                gh.enable = true;
                helix.enable = true;
                starship = {
                  enable = true;
                  enableZshIntegration = true;
                };
                tealdeer.enable = true;
                zellij.enable = true;
                zoxide = {
                  enable = true;
                  enableZshIntegration = true;
                };
                zsh.enable = true;
              };
            };
          };
        }
      ];
    };
  };
}