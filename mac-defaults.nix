{config, ...}: {
  targets.darwin.defaults = {
    "com.apple.dock" = {
      orientation = "bottom";
      tilesize = 36;
      autohide = true;
      "autohide-delay" = 0.0;
      launchanim = false;
      "static-only" = true;
      "show-process-indicators" = true;
      "show-recents" = false;
    };
    "com.apple.finder" = {
      AppleShowAllFiles = true;
      ShowPathbar = true;
      ShowStatusBar = true;
      _FXShowPosixPathInTitle = true; # Show full POSIX path in Finder window title
      FXEnableExtensionChangeWarning = false; # Disable warning when changing file extensions
      FXArrangeGroupViewBy = "Name";
      ShowExternalHardDrivesOnDesktop = true;
      ShowHardDrivesOnDesktop = false;
      ShowRemovableMediaOnDesktop = true;
      FXICloudDriveEnabled = false;
      CreateDesktop = true;
      AppleInterfaceStyle = "Dark";
      FXPreferredViewStyle = "clmv";
    };
    NSGlobalDomain = {
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      AppleShowScrollBars = "Always";
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSDocumentSaveNewDocumentsToCloud = false;
      NSWindowResizeTime = 0.0;
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      _HIHideMenuBar = true;
    };
    "com.apple.AdLib" = {allowApplePersonalizedAdvertising = false;};
    "com.apple.screencapture" = {
      location = "${config.home.homeDirectory}/Desktop";
    };
    "com.apple.screensaver" = {
      askForPassword = 1;
      askForPasswordDelay = 0;
    };
    "com.apple.LaunchServices" = {
      LSQuarantine = false;
    };
    trackpad.Clicking = true;
  };
}
