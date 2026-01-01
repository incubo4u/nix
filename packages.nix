{ pkgs }:

{
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
    oh-my-zsh
  ];

  guiApplications = with pkgs; [
    ghostty
    obsidian
    anki-bin
    keepassxc
  ];
}

