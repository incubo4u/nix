{...}: {
  homebrew = {
    enable = true;
    taps = [];
    brews = [];
    casks = [
      "kopiaui"
      "arc"
      "NetNewsWire"
      "ghostty"
      "homerow"
      "keepassxc"
      "notunes"
      "syncthing"
      "finetune"
    ];
    masApps = {
    };
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
  };
}
