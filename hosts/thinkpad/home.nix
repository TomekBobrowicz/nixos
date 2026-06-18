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
    ./secrets

    # Programs
    ../../home/programs/ghostty
    ../../home/programs/editors/nixvim.nix
    ../../home/programs/editors/vscode
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/media
    ../../home/programs/keepassxc

    # System (Desktop environment like stuff)
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/niri
    ../../home/system/noctalia

    inputs.catppuccin.homeModules.catppuccin
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      obsidian # Note taking app
      textpieces # Manipulate texts
      curtail # Compress images
      resources
      gnome-text-editor
      google-chrome # Web browser
      libreoffice # Office suite
      vesktop # Discord desktop app
      nautilus
      xdg-user-dirs
      zathura # PDF viewer

      # Utils
      zip
      unzip
      btop
      fastfetch

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix
    ];
    # Import my profile picture, used by the noctalia dashboard
    file.".face.icon" = {source = ./profile_picture.png;};
    file.".face" = {source = ./profile_picture.png;};

    # Don't touch this
    stateVersion = "26.05";
  };
  home.enableNixpkgsReleaseCheck = false;
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
    autoEnable = true;
    enable = true;
    accent = "lavender";
    flavor = "mocha";
    gtk = {
      icon = {
        enable = true;
        flavor = "mocha";
      };
    };
    ghostty = {
      enable = true;
    };
    btop = {
      enable = false;
    };
    vscode = {
      profiles = {
        default = {
          enable = true;
        };
      };
    };
  };
  programs.home-manager.enable = true;
}
