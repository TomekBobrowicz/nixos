{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      polkit = {
        enabled = true;
      };
      shell = {
        corner_radius_scale = 1.25;
        shadow = {
          direction = "down";
          alpha = 0.52;
        };

        panel = {
          background_blur = true;
          transparency_mode = "glass";
          borders = true;
          shadow = true;
          launcher_placement = "centered";
          clipboard_placement = "centered";
          control_center_placement = "attached";
          wallpaper_placement = "attached";
          session_placement = "attached";
        };
      };

      backdrop = {
        enabled = false;
        blur_intensity = 0.95;
        tint_intensity = 0.55;
      };

      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-tonal-spot";

        templates = {
          enable_builtin_templates = true;
          builtin_ids = [
            "ghostty"
            "btop"
            #"neovim"
            "niri"
            #"qt"
            #"gtk3"
            #gtk4"
          ];
        };
      };

      wallpaper = {
        enabled = true;
        fill_mode = "fill";
        transition = [
          "fade"
          "wipe"
          "disc"
          "stripes"
          "zoom"
          "honeycomb"
        ];
        transition_duration = 1500;
        edge_smoothness = 0.3;
        directory = "~/Pictures/Wallpapers";
      };
      location = {
        autoLocate = true;
      };

      bar.default = {
        background_opacity = 0.58;
        radius = 18;
        margin_ends = 0;
        margin_edge = 5;
        shadow = true;
        start = [
          "control-center"
          "launcher"
          "wallpaper"
          "workspaces"
          #"active_window"
        ];
        center = [
          "clock"
          "weather"
        ];
        end = [
          "tray"
          "notifications"
          "clipboard"
          "network"
          "bluetooth"
          "volume"
          "brightness"
          "battery"
          "screenshot"
          "theme_mode"
          "session"
        ];
      };

      widget.workspaces = {
        type = "workspaces";
        minimal = true;
      };
      widget.control-center = {
        type = "control-center";
        custom_image = "/run/current-system/sw/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        scale = 1.25;
      };
      widget.network = {
        showLabel = false;
      };
      widget.tray = {
        drawer = true;
        hidden = ["udiskie" "blueman" "Network"];
      };
      widget.volume = {
        showLabel = false;
      };
      widget.battery = {
        showLabel = false;
      };
      widget.brightness = {
        showLabel = false;
      };

      notification.background_opacity = 0.78;
      osd.background_opacity = 0.78;
      idle = {
        behavior_order = ["lock" "screen-off" "lock-and-suspend"];
        pre_action_fade_seconds = 5;

        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 300;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 330;
          };

          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 600;
          };
        };
      };
    };
  };
}
