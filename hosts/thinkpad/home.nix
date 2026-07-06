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
      #textpieces # Manipulate texts
      #curtail # Compress images
      #resources
      gnome-text-editor
      google-chrome # Web browser
      #libreoffice # Office suite
      equibop# Discord desktop app
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
  xdg.configFile."mimeapps.list".force = true;
  xdg.configFile."ghostty/config".force = true;
  xdg.configFile."btop/btop.conf".force = true;
  xdg.configFile."gtk-4.0/gtk.css".force = true;
  xdg.configFile."gtk-3.0/gtk.css".force = true;

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
    accent = "yellow";
    flavor = "mocha";
    gtk = {
      icon = {
        flavor = "mocha";
      };
    };

    btop = {
      enable = false;
    };
    vscode.profiles.default.enable=false;
  };
  programs.home-manager.enable = true;
}
