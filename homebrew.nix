{...}: {
  homebrew = {
    enable = true;
    taps = [];
    brews = [];
    casks = [
      "openmtp"
      "android-commandlinetools"
      "kopiaui"
      # "helium-browser"
      "NetNewsWire"
      "ghostty"
      "homerow"
      "keepassxc"
      "notunes"
      "syncthing-app"
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
