
{ pkgs }:
{
  editors = with pkgs; [neovim vim ];
  languages = with pkgs; [ cargo go lua python3 rustc zig ];
  networkingTools = with pkgs; [ curl nmap wget wireshark ];
  macOsUtils = with pkgs; [ rectangle ];
  systemUtilities = with pkgs; [
    atuin
    bat
    carapace
    git
    ripgrep
    tmux
    tree
    zsh
    fzf
    oh-my-zsh
    delta
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
}
