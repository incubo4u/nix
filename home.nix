{pkgs, ...}: let
  packages = import ./packages.nix {inherit pkgs;};
in {
  home.username = "mikolajkozakiewicz";
  home.homeDirectory = "/Users/mikolajkozakiewicz";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
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
  programs.git.enable = true;
  programs.tmux.enable = true;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    EDITOR = "nvim";
    COMPLETION_WAITING_DOTS = "true";
    HIST_STAMPS = "mm/dd/yyyy";
    CARAPACE_BRIDGES = "zsh,bash";
  };
  home.shell.enableZshIntegration = true;
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
