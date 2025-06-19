{
  description = "setups";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
  }: let
    configuration = {pkgs, ...}: let
      editors = with pkgs; [
        neovim
        vim
      ];

      languages = with pkgs; [
        cargo
        go
        lua
        python3
        rustc
        zig
      ];
      networkingTools = with pkgs; [
        curl
        nmap
        wget
        wireshark
      ];

      macOsUtils = with pkgs; [
        rectangle
      ];

      systemUtilities = with pkgs; [
        atuin
        bat
        carapace
        git
        ripgrep
        tmux
        tree
        zsh
      ];

      guiApplications = with pkgs; [
        anki-bin
        docker
        karabiner-elements
        obsidian
      ];
      broken = with pkgs; [
        ghostty
        ipython
        keepassxc
        syncthing
      ];
    in {
      nix.gc.automatic = true;
      nix.gc.options = "--delete-older-than 7d";
      nix.optimise.automatic = true;
      nix.settings.experimental-features = "nix-command flakes";
      nixpkgs.config.allowUnfree = true;
      nixpkgs.hostPlatform = "x86_64-darwin";
      programs.zsh.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;

      # Special handling for GUI applications or servises
      environment.systemPackages = builtins.concatLists [
        guiApplications
        macOsUtils
        systemUtilities
        networkingTools
        languages
        editors
        #broken
      ];
    };
  in {
    # Build darwin flake using:
    darwinConfigurations."incubo" = nix-darwin.lib.darwinSystem {
      modules = [configuration];
    };
  };
}
