{
  lib,
  pkgs,
  config,
  ...
}: {
  options.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {
      rounding = 15;
      gaps-in = 8;
      gaps-out = 8 * 2;
      active-opacity = 0.75;
      inactive-opacity = 0.86;
      blur = true;
      border-size = 3;
      animation-speed = "fast"; # "fast" | "medium" | "slow"
      fetch = "none"; # "nerdfetch" | "neofetch" | "pfetch" | "none"
      textColorOnWallpaper =
        config.lib.stylix.colors.base05; # Color of the text displayed on the wallpaper (Lockscreen, display manager, ...)

      bar = {
        # Hyprpanel
        position = "top"; # "top" | "bottom"
        transparent = true;
        transparentButtons = false;
        floating = true;
      };
    };
    description = "Theme configuration options";
  };

  config.stylix = {
    enable = true;

    # Kanagawa
    # See https://tinted-theming.github.io/tinted-gallery/ for more schemes
    base16Scheme = {
      base00 = "1f1f28"; # Default Background
      base01 = "2a2a37"; # Lighter Background (Used for status bars, line number and folding marks)
      base02 = "223249"; # Selection Background
      base03 = "727169"; # Comments, Invisibles, Line Highlighting
      base04 = "c8c093"; # Dark Foreground (Used for status bars)
      base05 = "dcd7ba"; # Default Foreground, Caret, Delimiters, Operators
      base06 = "938aa9"; # Light Foreground (Not often used)
      base07 = "363646"; # Light Background (Not often used)
      base08 = "c34043"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
      base09 = "ffa066"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
      base0A = "c0a36e"; # Classes, Markup Bold, Search Text Background
      base0B = "76946a"; # Strings, Inherited Class, Markup Code, Diff Inserted
      base0C = "7aa89f"; # Support, Regular Expressions, Escape Characters, Markup Quotes
      base0D = "7e9cd8"; # Functions, Methods, Attribute IDs, Headings, Accent color
      base0E = "957fb8"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
      base0F = "d27e99"; # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
    };

    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.maple-mono.Normal-NF-unhinted;
        name = "Maple Mono Normal NF";
      };
      sansSerif = {
        package = pkgs.source-sans-pro;
        name = "Source Sans Pro";
      };
      serif = config.stylix.fonts.sansSerif;
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 13;
        desktop = 13;
        popups = 13;
        terminal = 13;
      };
    };

    polarity = "dark";
  };
}
