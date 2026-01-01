{ ... }:

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
          dwt = true; # disable while typing
        };
      };

      binds = {
        "Alt+h" = "focus-column-left";
        "Alt+l" = "focus-column-right";
        "Alt+j" = "focus-window-down";
        "Alt+k" = "focus-window-up";

        "Alt+Return" = {
          action = "spawn";
          command = [ "ghostty" ];
        };
      };
    };
  };
}

