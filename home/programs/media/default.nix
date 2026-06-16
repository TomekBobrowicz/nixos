{pkgs, ...}:
# media - control and enjoy audio/video
{
  imports = [
    ./mpv.nix
  ];

  home.packages = with pkgs; [
    # audio control
    pulsemixer
    pwvucontrol
    crosspipe

    # audio
    amberol
    pear-desktop

    # images
    loupe

    # videos
    celluloid
    vlc # Video player

    # torrents
    transmission_4-gtk
  ];
}
