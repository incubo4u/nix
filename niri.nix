{ pkgs, ... }:

{
  programs.niri = {
    enable = true;

    settings = {
      input = {
        keyboard = {
          xkb = {
            options = "caps:escape";
          };
        };

        touchpad = {
          tap = true;
          natural-scroll = true;

          # 👇 THIS disables touchpad while typing
          dwt = true;
        };
      };

      binds = {
        "Alt+h" = { action = "focus-column-left"; };
        "Alt+l" = { action = "focus-column-right"; };
        "Alt+j" = { action = "focus-window-down"; };
        "Alt+k" = { action = "focus-window-up"; };

        "Alt+Return" = { action = "spawn"; command = [ "ghostty" ]; };
      };
    };
  };
}

