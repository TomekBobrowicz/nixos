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
    };
    description = "Theme configuration options";
  };

  config.stylix = {
    enable = true;

    # Kanagawa
    # See https://tinted-theming.github.io/tinted-gallery/ for more schemes
    base16Scheme = {
      base00 = "1f1f28";
      base01 = "16161d";
      base02 = "223249";
      base03 = "54546d";
      base04 = "727169";
      base05 = "dcd7ba";
      base06 = "c8c093";
      base07 = "717c7c";
      base08 = "c34043";
      base09 = "ffa066";
      base0A = "c0a36e";
      base0B = "76946a";
      base0C = "6a9589";
      base0D = "7e9cd8";
      base0E = "957fb8";
      base0F = "d27e99";
    };

    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 20;
    };

    fonts = {
      monospace = {
        package = pkgs.maple-mono.NF;
        name = "";
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
        applications = 11;
        desktop = 11;
        popups = 11;
        terminal = 13;
      };
    };

    polarity = "dark";
    #image = ./walls/kanagawa.jpg;
    #   url = "https://raw.githubusercontent.com/orangci/walls-catppuccin-mocha/master/street.png";
    #   sha256 = "sha256-xSx87bFMgwMkYKiqflXoSmjMiyOBPdKwAPI0lGOeOFI=";
    # };
  };
}
