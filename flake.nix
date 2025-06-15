{
  description = "darwin_intel";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs,programs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.vim
          pkgs.neovim
          pkgs.ripgrep
          pkgs.tmux
          pkgs.tree
          pkgs.wget
          pkgs.zig
          pkgs.nmap
          # pkgs.ipython  not available
          pkgs.bat
          pkgs.docker
          pkgs.python3
          pkgs.go
          pkgs.cargo
          pkgs.rustc
        ];
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."incubo" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
