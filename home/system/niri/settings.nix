{pkgs, ...}: {
  wayland.windowManager.niri.settings = {
    environment = {
      CLUTTER_BACKEND = "wayland";
      DISPLAY = null;
      GDK_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
    };
    spawn-at-startup = [
      ["wl-paste" "--watch" "cliphist" "store"]
      ["dbus-update-activation-environment" "--systemd" "WAYLAND_DISPLAY" "XDG_CURRENT_DESKTOP"]
      ["${pkgs.xwayland-satellite}/bin/xwayland-satellite"]
      ["${pkgs.xdg-desktop-portal-gnome}/libexec/xdg-desktop-portal-gnome"]
      ["noctalia"]
      ["systemctl --user start sops-nix"]
    ];
    layer-rule = [
      {
        match = [
          {_props.namespace = "noctalia-wallpaper*";}
        ];
        "place-within-backdrop" = true;
      }
    ];
    layout.background-color = "transparent";
    overview.workspace-shadow = {
      off = [];
    };
    cursor = {
      hide-after-inactive-ms = 5000;
    };
    input = {
      keyboard = {
        repeat-delay = 200;
        repeat-rate = 60;
        xkb = {
          layout = "pl";
        };
      };
      touchpad = {
        tap = [];
        dwt = [];
        "natural-scroll" = [];
        "click-method" = "clickfinger";
      };
      "focus-follows-mouse" = [];
    };
    output = [
      {
        _args = ["eDP-1"];
        mode = "1920x1080";
        scale = 1;
      }
    ];
    screenshot-path = "~/Pictures/Screenshots/Screenshot-from-%Y-%m-%d-%H-%M-%S.png";

    layout = {
      struts.top = -8;

      always-center-single-column = [];
      default-column-width.proportion = 0.5;

      focus-ring.width = 2;
      border.off = [];

      tab-indicator = {
        hide-when-single-tab = [];
        gap = -16;
        gaps-between-tabs = 4;
        width = 10;
        corner-radius = 3;
        length._props.total-proportion = 0.15;
        position = "top";
      };
    };

    animations = {
      window-open = {
        duration-ms = 250;
        curve = "ease-out-expo";
      };
      window-close = {
        duration-ms = 250;
        curve = "ease-out-quad";
      };
      exit-confirmation-open-close.off = [];
    };
    blur = {
      on = [];
      passes = 4;
    };
    hotkey-overlay = {
      skip-at-startup = [];
      hide-not-bound = [];
    };
    prefer-no-csd = [];
  };
}
