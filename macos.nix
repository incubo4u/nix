{ config, pkgs, lib, ... }:

{
  networking.hostName = "incubo"; 
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = [ "03:00" ];
  system.activationScripts.postUserActivation.text = ''
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
  system.defaults.dock = {
    orientation = "bottom";
    tilesize = 36;
    autohide = true;
    autohide-delay = 0.0;
    launchanim = false;
    static-only = true;
    show-process-indicators = true;
    show-recents = false;
  };
  system.defaults.finder = {
    AppleShowAllFiles = true; 
    ShowPathbar = true; 
    ShowStatusBar = true; 
    _FXShowPosixPathInTitle = true; 
    FXEnableExtensionChangeWarning = false;
  };
  system.defaults.NSGlobalDomain = {
    KeyRepeat = 2; # Faster key repeat
    InitialKeyRepeat = 15; # Shorter delay until repeat
    AppleShowScrollBars = "Always";
  };
  system.defaults.com.apple.screencapture = {
    location = "~/Desktop";
  };
  system.defaults.com.apple.screensaver = {
    askForPassword = 1;
    askForPasswordDelay = 0;
  };
  security.firewall.enable = true;
  security.firewall.allowedApplications = [
    # { application = "/Applications/Google Chrome.app"; allow = true; }
  ];
  services.keychain.enable = true;
  fonts.fontDir.enable = true; 
  fonts.fonts = with pkgs; [
    nerdfonts.fonts.JetBrainsMono
  ];
}
