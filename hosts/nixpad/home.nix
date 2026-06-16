{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/ghostty
    ../../home/programs/editors/nixvim.nix
    ../../home/programs/editors/vscode
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/media

    # System (Desktop environment like stuff)
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/niri
    ../../home/system/dms

    inputs.catppuccin.homeModules.catppuccin
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      blanket # White-noise app
      obsidian # Note taking app
      gnome-calendar # Calendar
      textpieces # Manipulate texts
      curtail # Compress images
      resources
      gnome-clocks
      gnome-text-editor
      figma-linux
      google-chrome # Web browser
      waypaper # Wallpaper manager
      libreoffice # Office suite
      vesktop # Discord desktop app
      nautilus
      xdg-user-dirs
      xdg-user-dirs-gtk

      # Utils
      zip
      unzip
      optipng
      jpegoptim
      pfetch
      btop
      fastfetch
      imagemagick

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix
    ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".face.icon" = {source = ./profile_picture.png;};
    file.".face" = {source = ./profile_picture.png;};

    # Don't touch this
    stateVersion = "26.05";
  };
  home.enableNixpkgsReleaseCheck = false;
  #stylix.image = ../../walls/office.jpg;
  stylix.targets = {
    ghostty.enable = false;
    btop.enable = false;
    gtk.enable = true; #setting 4now b/c false breaks themeing
    kitty.enable = false;
    neovim.enable = false;
    nvf.enable = false;
    nixvim.enable = false;
    vscode.enable = false;
    starship.enable = false;
    qt = {
      enable = false;
      platform = "qtct";
    };
  };

  catppuccin = {
    enable = false;
    accent = "lavender";
    flavor = "mocha";
    gtk = {
      icon = {
        enable = true;
        flavor = "mocha";
      };
    };
    ghostty = {
      enable = false;
    };
    vscode = {
      profiles = {
        default = {
          enable = false;
        };
      };
    };
  };

  programs.home-manager.enable = true;
}
