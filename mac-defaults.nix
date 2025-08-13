{config, ...}: {
  targets.darwin.defaults = {
    "com.apple.dock" = {
      "autohide-delay" = 0.0;
      show-recents = false;
      static-only = true;
      autohide = true;
      launchanim = false;
      orientation = "bottom";
      tilesize = 36;
      persistent-apps = [
        "/Applications/Arc.app"
        "/Applications/Signal.app"
        "/Applications/Ghostty.app"
      ];
    };
    #disable apple inteligence
    "com.apple.CloudSubscriptionFeatures.optIn" = {
      "545129924" = "false";
    };

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      CreateDesktop = false;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      NewWindowTarget = "Home";
      ShowExternalHardDrivesOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowMountedServersOnDesktop = false;
      ShowRemovableMediaOnDesktop = false;
      ShowPathbar = true;
      ShowStatusBar = true;
      _FXShowPosixPathInTitle = true;
      _FXSortFoldersFirst = true;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
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
