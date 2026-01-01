{ pkgs, ... }:

let
  packages = import ./packages.nix { inherit pkgs; };
in {
  home.username = "principe";
  home.homeDirectory = "/home/principe";
  home.stateVersion = "25.05";

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  #### Shell ####
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };

    shellAliases = {
      ll = "ls -al";
      ".." = "cd ..";
      "..." = "cd ../../";
      gs = "git status";
      gd = "git diff";
      gds = "git diff --staged";
      gt = "git log --graph --oneline --decorate";
      hm = "home-manager switch --flake ~/.config/nix#principe";
    };

    initExtra = ''
      set -o vi
      [[ -n "$SSH_CONNECTION" ]] && export EDITOR=vim
    '';
  };

  #### Git ####
  programs.git = {
    enable = true;
    extraConfig = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      merge.conflictStyle = "zdiff3";
    };
  };

  #### Tmux ####
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-a";
    keyMode = "vi";
    historyLimit = 9999999;

    extraConfig = ''
      bind Space split-window -h
      bind Enter split-window -v
      unbind '"'
      unbind %
    '';
  };

  #### Prompt ####
  programs.starship.enable = true;

  #### History ####
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [ "--disable-up-arrow" ];
  };

  programs.fzf.enable = true;
  programs.carapace.enable = true;

  #### Syncthing (user service) ####
  services.syncthing = {
    enable = true;
  };

  #### Wayland / Niri ####
  imports = [
    ./niri.nix
  ];

  #### Packages ####
  home.packages = builtins.concatLists [
    packages.systemUtilities
    packages.editors
    packages.languages
    packages.networkingTools
    packages.guiApplications
  ];
}

