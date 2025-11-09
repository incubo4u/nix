{pkgs}: {
  editors = with pkgs; [neovim vim];
  languages = with pkgs; [rustup  go lua zig 
    (python3.withPackages (pypkgs: [
      pypkgs.beancount
      pypkgs.ipython
    ]))
  ];
  networkingTools = with pkgs; [curl nmap wget];
  systemUtilities = with pkgs; [
    starship
    atuin
    bat
    git
    ripgrep
    tmux
    tree
    zsh
    fzf
    oh-my-zsh
    delta
    lazydocker
  ];
  guiApplications = with pkgs; [
    anki-bin
    docker
    obsidian
  ];
}
