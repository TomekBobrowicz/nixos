{
  config,
  pkgs,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
  in {
    "Mod+E".action = spawn ["nautilus"];
    "Mod+B".action = spawn ["google-chrome-stable"];
    "Mod+C".action = spawn ["code"];
    "Mod+D".action = spawn ["vesktop"];
    "Mod+Print".action.screenshot-screen = {write-to-disk = true;};
    "Mod+Shift+S".action.screenshot = {show-pointer = false;};
    "Mod+Return".action = spawn "${pkgs.ghostty}/bin/ghostty";

    "Mod+A".action = toggle-overview;
    "Mod+Q".action = close-window;
    "Mod+F".action = maximize-column;

    "Mod+WheelScrollDown".action = focus-workspace-down;
    "Mod+WheelScrollUp".action = focus-workspace-up;

    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+6".action = focus-workspace 6;
    "Mod+7".action = focus-workspace 7;
    "Mod+8".action = focus-workspace 8;
    "Mod+9".action = focus-workspace 9;
    "Mod+0".action = focus-workspace 10;

    "Mod+Shift+F".action = fullscreen-window;
    "Mod+Shift+T".action = toggle-window-floating;
    "Mod+Shift+C".action = center-visible-columns;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Equal".action = set-column-width "+10%";
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Equal".action = set-window-height "+10%";

    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-workspace-down;
    "Mod+Up".action = focus-workspace-up;

    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Right".action = move-column-right;
    "Mod+Shift+Up".action = move-column-to-workspace-up;
    "Mod+Shift+Down".action = move-column-to-workspace-down;

    "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
    
    "Mod+Space".action.spawn = [
      "noctalia"
      "msg"
      "panel-toggle"
      "launcher"
    ];
    "Mod+S".action.spawn = [
      "noctalia"
      "msg"
      "panel-toggle"
      "control-center"
    ];
    "Mod+W".action.spawn = [
      "noctalia"
      "msg"
      "panel-toggle"
      "wallpaper"
    ];
    "Alt+S".action.spawn = [
      "noctalia"
      "msg"
      "settings-toggle"
    ];
    "XF86AudioRaiseVolume".action.spawn = [
      "noctalia"
      "msg"
      "volume-up"
    ];
    "XF86AudioLowerVolume".action.spawn = [
      "noctalia"
      "msg"
      "volume-down"
    ];
    "XF86AudioMute".action.spawn = [
      "noctalia"
      "msg"
      "volume-mute"
    ];
    "XF86MonBrightnessUp".action.spawn = [
      "noctalia"
      "msg"
      "brightness-up"
    ];
    "XF86MonBrightnessDown".action.spawn = [
      "noctalia"
      "msg"
      "brightness-down"
    ];
    "XF86AudioPlay".action.spawn = [
      "playerctl"
      "play-pause"
    ];
    "XF86AudioStop".action.spawn = [
      "playerctl"
      "stop"
    ];
    "XF86AudioPrev".action.spawn = [
      "playerctl"
      "previous"
    ];
    "XF86AudioNext".action.spawn = [
      "playerctl"
      "next"
    ];
  };
}
