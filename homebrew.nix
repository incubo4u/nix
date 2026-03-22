{...}: {
  homebrew = {
    enable = true;
    taps = [];
    brews = [];
    casks = [
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
