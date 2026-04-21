{...}: {
  homebrew = {
    enable = true;
    taps = [];
    brews = [];
    casks = [
      "openmtp"
      "android-commandlinetools"
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
