
{ pkgs, ... }:

let
  packages = import ./packages.nix { inherit pkgs; };
in {
  home.username = "mikolajkozakiewicz";
  home.homeDirectory = "/Users/mikolajkozakiewicz";
  home.stateVersion = "23.11";

  programs.zsh = {
    enable = true;
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
    };
    initExtra = ''
      if [[ -n "$SSH_CONNECTION" ]]; then
        export EDITOR='vim'
      else
        export EDITOR='nvim'
      fi
      eval "$(atuin init zsh --disable-up-arrow)"
    '';
  };

  programs.atuin.enable = true;
  programs.git.enable = true;
  programs.tmux.enable = true;

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    EDITOR = "nvim";
    COMPLETION_WAITING_DOTS = "true";
    HIST_STAMPS = "mm/dd/yyyy";
  };

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
