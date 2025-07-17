{pkgs, ...}: let
  packages = import ./packages.nix {inherit pkgs;};
in {
  home.username = "mikolaj";
  home.homeDirectory = "/Users/mikolaj";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    EDITOR = "nvim";
    COMPLETION_WAITING_DOTS = "true";
    HIST_STAMPS = "mm/dd/yyyy";
    CARAPACE_BRIDGES = "zsh,bash";
  };
  home.shell.enableZshIntegration = true;
  programs.home-manager.enable = true;
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
    historyLimit = 9999999;
    extraConfig = ''
      bind Space split-window -h
      bind Enter split-window -v
      unbind '"'
      unbind %
      bind s select-pane -t :.+


      set -g @fg "#deeeed"
      set -g @bg "#242424"
      set -g @muted "#7a7a7a"
      set -g @blue "#7788aa"
      set -g @lack "#708090"

      set -g status on
      set -g status-style "fg=#{@fg},bg=#{@bg}"
      set -g status-left-length 100
      set -g status-right-length 100

      set -g window-status-style "fg=#{@muted},bg=#{@bg}"
      set -g window-status-format " #I:#W#F"

      set -g window-status-current-style "fg=#{@fg},bg=#{@bg}"
      set -g window-status-current-format " #I:#W#F"

      set -g status-left-style "fg=#{@bg},bg=#{@lack},bold"
      set -g status-left " #S "

      set -g status-right-style "fg=#{@bg},bg=#{@blue},bold"
      set -g status-right "#{?client_prefix, PREFIX ,}"
    '';
  };
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = ["git"];
    };
    shellAliases = {
      ll = "ls -al";
      "cd.." = "cd ..";
      ".." = "cd ..";
      "..." = "cd ../../";
      gs = "git status";
      gp = "git pull";
      gd = "git diff";
      gds = "git diff --staged";
      gt = "git log --graph --oneline --decorate";
      nixrb = "sudo darwin-rebuild switch --flake .#incubo";
    };
    initExtra = ''
      if [[ -n "$SSH_CONNECTION" ]]; then
        export EDITOR='vim'
      fi
    '';
  };
  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = ["--disable-up-arrow"];
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  imports = [
    ./mac-defaults.nix
  ];
  home.packages = builtins.concatLists [
    packages.systemUtilities
    packages.editors
    packages.languages
    packages.networkingTools
    packages.macOsUtils
    packages.guiApplications
    # packages.broken
  ];
}
