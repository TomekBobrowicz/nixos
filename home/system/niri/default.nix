{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.niri-nix.homeModules.stylix
    inputs.niri.homeModules.default
    ./settings.nix
    ./binds.nix
    ./rules.nix
  ];

  home.packages = with pkgs; [
    # screenshot
    grim
    slurp
    awww

    # utils
    wl-clipboard

    #fonts
    fira-code-symbols
    material-symbols
    inter

    xwayland-satellite
  ];

  wayland.windowManager.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
  xdg.portal = {
    enable = true;
    config.niri = {
      default = ["gnome" "gtk"];
      "org.freedesktop.impl.portal.Access" = "gtk";
      "org.freedesktop.impl.portal.ScreenCast" = "gnome";
      "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
    };

    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
