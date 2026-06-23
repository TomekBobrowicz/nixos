{config, ...}: let
  inherit (config.lib.stylix) colors;
in {
  wayland.windowManager.niri.settings.window-rule = [
    {
      clip-to-geometry = true;
      geometry-corner-radius = 12.0;
      draw-border-with-background = false;
    }
    {
      match._props.is-window-cast-target = true;
      focus-ring.off = [];
      border = {
        on = [];
        width = 2;
        active-color = "#85a3e8";
      };
      shadow = {
        on = [];
        color = "#8392b698";
      };
    }
    # bulk window rules
    {
      open-maximized = true;

      _children = [
        {match._props.app-id = "firefox";}
        {match._props.app-id = "google-chrome";}
        {match._props.app-id = "yazi";}
        {match._props.app-id = "code";}
        {match._props.app-id = "obsidian";}
        {match._props.app-id = "dev.zed.Zed";}
        {match._props.app-id = "vesktop";}
        {match._props.app-id = "^libreoffice-.*$";}
        {match._props.title = "^LibreOffice";}
        {match._props.app-id = "ONLYOFFICE";}
      ];
    }
    {
      open-floating = true;
      border = {
        on = [];
        width = 2;
        inactive-color = colors.withHashtag.base03;
      };
      shadow.on = [];

      _children = [
        {match._props.app-id = "org.gnome.Calculator";}
        {match._props.app-id = "zenity";}
        {match._props.title = "System Monitor";}
      ];
    }
    {
      default-column-display = "tabbed";

      _children = [
        {match._props.app-id = "kitty";}
        {match._props.app-id = "sioyek";}
      ];
    }
    {
      scroll-factor = 0.4;

      _children = [
        {match._props.app-id = "obsidian";}
        {match._props.app-id = "com.github.th_ch.youtube_music";}
        {match._props.app-id = "vesktop";}
      ];
    }
    {
      background-effect = {
        blur = true;
        xray = false;
      };

      _children = [
        {match._props.app-id = "firefox";}
        {match._props.app-id = "google-chrome";}
        {match._props.app-id = "kitty";}
        {match._props.app-id = "yazi";}
        {match._props.app-id = "nix-search-tv";}
        {match._props.title = "Vicinae Settings";}
        {match._props.app-id = "dev.zed.Zed";}
      ];
    }
  ];
}
