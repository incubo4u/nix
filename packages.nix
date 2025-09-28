{pkgs}: {
  editors = with pkgs; [neovim vim];
  languages = with pkgs; [rustup rustc go lua  zig 
    (python3.withPackages (pypkgs: [
      pypkgs.beancount
      # pypkgs.fava
      pypkgs.ipython
    ]))
  ];
  networkingTools = with pkgs; [curl nmap wget wireshark];
  macOsUtils = with pkgs; [rectangle];
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
    colima
    lazydocker
  ];
  guiApplications = with pkgs; [
    anki-bin
    docker
    karabiner-elements
    obsidian
  ];
  broken = with pkgs; [
    ghostty
    keepassxc
    syncthing
  ];
}
