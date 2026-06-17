{
  pkgs,
  inputs,
  ...
}:
# Wayland config
{
  imports = [
    inputs.niri.homeModules.niri
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

  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
