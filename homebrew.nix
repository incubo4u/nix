
{...}:

{
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
      "Slack" = 803453959;
    };
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "none"; #"zap";
    };
  };
}
