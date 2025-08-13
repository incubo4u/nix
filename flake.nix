{
  description = "setups";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
  }: let
    system = "aarch64-darwin";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    packages = import ./packages.nix {inherit pkgs;};

    darwinConfig = {...}: {
      system.primaryUser = "mikolaj";
      nix.gc.automatic = true;
      nix.gc.options = "--delete-older-than 7d";
      nix.optimise.automatic = true;
      nix.settings.experimental-features = "nix-command flakes";
      nixpkgs.hostPlatform = system;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;
      users.users.mikolaj = {
        name = "mikolaj";
        home = "/Users/mikolaj";
      };
      environment.shells = with pkgs; [zsh];
      programs.zsh.enable = true;

      environment.systemPackages = builtins.concatLists [
        packages.macOsUtils
        packages.guiApplications
      ];
      imports = [
        ./homebrew.nix
        home-manager.darwinModules.home-manager
      ];
      home-manager.backupFileExtension = "backup";
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.mikolaj = import ./home.nix {
        inherit pkgs;
      };
    };
  in {
    darwinConfigurations."incubo" = nix-darwin.lib.darwinSystem {
      system = system;
      modules = [darwinConfig];
    };
  };
}
