
{...}:

{
  services.homebrew = {
    enable = true;
    autoMigrate = true;
    taps = [];
    brews = [];
    casks = [
      "arc"
      "homerow"
      "notunes"
    ];
    masApps = {
      "Slack" = 803453959;
    };
    onActivation = {
      enable = true;
      autoUpdate = true;
      upgrade = true;
      cleanup = true;
    };
    cleanup = {
      enable = true;
      periodic = true;
    };
  };
}
