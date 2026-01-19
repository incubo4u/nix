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
    TERM = "xterm-256color";
  };

  programs.home-manager.enable = true;

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

  programs.git = {
    enable = true;
    extraConfig = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      merge.conflictStyle = "zdiff3";
    };
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-a";
    keyMode = "vi";

    extraConfig = ''
      bind Space split-window -h
      bind Enter split-window -v
      unbind '"'
      unbind %
    '';
  };

  programs.starship.enable = true;
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [ "--disable-up-arrow" ];
  };

  programs.fzf.enable = true;
  programs.carapace.enable = true;

  services.syncthing = {
    enable = true;
  };

  home.packages = builtins.concatLists [
    packages.systemUtilities
    packages.editors
    packages.languages
    packages.networkingTools
    packages.guiApplications
  ];
}

