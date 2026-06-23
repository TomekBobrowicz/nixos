{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.niri.settings.binds = {
    "Mod+E"."spawn" = ["nautilus"];
    "Mod+B"."spawn" = ["google-chrome-stable"];
    "Mod+C"."spawn" = ["code"];
    "Mod+D"."spawn" = ["vesktop"];
    "Mod+Return"."spawn" = ["${pkgs.ghostty}/bin/ghostty"];

    "Ctrl+Print"."screenshot-window" = {
      _props."show-pointer" = true;
    };
    "Mod+Shift+S"."screenshot" = [];
    "Print"."screenshot-screen" = {
      _props."show-pointer" = false;
    };

    "Mod+A"."toggle-overview" = [];
    "Mod+Q"."close-window" = [];
    "Mod+F"."maximize-column" = [];

    "Mod+WheelScrollDown"."focus-workspace-down" = [];
    "Mod+WheelScrollUp"."focus-workspace-up" = [];

    "Mod+1"."focus-workspace" = [1];
    "Mod+2"."focus-workspace" = [2];
    "Mod+3"."focus-workspace" = [3];
    "Mod+4"."focus-workspace" = [4];
    "Mod+5"."focus-workspace" = [5];
    "Mod+6"."focus-workspace" = [6];
    "Mod+7"."focus-workspace" = [7];
    "Mod+8"."focus-workspace" = [8];
    "Mod+9"."focus-workspace" = [9];
    "Mod+0"."focus-workspace" = [10];

    "Mod+Shift+F"."fullscreen-window" = [];
    "Mod+Shift+T"."toggle-window-floating" = [];
    "Mod+Shift+C"."center-visible-columns" = [];

    "Mod+Minus"."set-column-width" = ["-10%"];
    "Mod+Equal"."set-column-width" = ["+10%"];
    "Mod+Shift+Minus"."set-window-height" = ["-10%"];
    "Mod+Shift+Equal"."set-window-height" = ["+10%"];

    "Mod+Left"."focus-column-left" = [];
    "Mod+Right"."focus-column-right" = [];
    "Mod+Down"."focus-workspace-down" = [];
    "Mod+Up"."focus-workspace-up" = [];

    "Mod+Shift+Left"."move-column-left" = [];
    "Mod+Shift+Right"."move-column-right" = [];
    "Mod+Shift+Up"."move-column-to-workspace-up" = [];
    "Mod+Shift+Down"."move-column-to-workspace-down" = [];

    "Mod+Shift+Ctrl+J"."move-column-to-monitor-down" = [];
    "Mod+Shift+Ctrl+K"."move-column-to-monitor-up" = [];

    "Mod+Space"."spawn" = [
      "noctalia"
      "msg"
      "panel-toggle"
      "launcher"
    ];

    "Mod+S"."spawn" = [
      "noctalia"
      "msg"
      "panel-toggle"
      "control-center"
    ];
    "Mod+W"."spawn" = [
      "noctalia"
      "msg"
      "panel-toggle"
      "wallpaper"
    ];
    "Alt+S"."spawn" = [
      "noctalia"
      "msg"
      "settings-toggle"
    ];
    "Mod+L"."spawn" = [
      "noctalia"
      "msg"
      "session"
      "lock"
    ];
    "Mod+X"."spawn" = [
      "noctalia"
      "msg"
      "panel-toggle"
      "session"
    ];

    "XF86AudioRaiseVolume"."spawn" = [
      "noctalia"
      "msg"
      "volume-up"
    ];
    "XF86AudioLowerVolume"."spawn" = [
      "noctalia"
      "msg"
      "volume-down"
    ];
    "XF86AudioMute"."spawn" = [
      "noctalia"
      "msg"
      "volume-mute"
    ];
    "XF86MonBrightnessUp"."spawn" = [
      "noctalia"
      "msg"
      "brightness-up"
    ];
    "XF86MonBrightnessDown"."spawn" = [
      "noctalia"
      "msg"
      "brightness-down"
    ];
    "XF86AudioPlay"."spawn" = [
      "playerctl"
      "play-pause"
    ];
    "XF86AudioStop"."spawn" = [
      "playerctl"
      "stop"
    ];
    "XF86AudioPrev"."spawn" = [
      "playerctl"
      "previous"
    ];
    "XF86AudioNext"."spawn" = [
      "playerctl"
      "next"
    ];
  };
}
