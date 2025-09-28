{...}: {
  homebrew = {
    enable = true;
    taps = [];
    brews = [];
    casks = [
      "arc"
      "NetNewsWire"
      "ghostty"
      "google-chrome"
      "homerow"
      "keepassxc"
      "notunes"
      "syncthing"
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
