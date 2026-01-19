{ pkgs }:

{
  editors = with pkgs; [
    neovim
    vim
  ];

  languages = with pkgs; [
    go
    lua
    python3
    rustc
  ];

  networkingTools = with pkgs; [
    curl
    wget
    nmap
    wireshark
  ];

  systemUtilities = with pkgs; [
    git
    delta
    ripgrep
    bat
    tree
    tmux
    fzf
    starship
    atuin
    zsh
  ];

  guiApplications = with pkgs; [
    ghostty
    obsidian
    anki-bin
    keepassxc
  ];
}

