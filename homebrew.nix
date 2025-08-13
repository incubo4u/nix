{...}: {
  homebrew = {
    enable = true;
    taps = [];
    brews = [];
    casks = [
      "arc"
      "homerow"
      "notunes"
      "ghostty"
      "keepassxc"
      "syncthing"
      "google-chrome"
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
