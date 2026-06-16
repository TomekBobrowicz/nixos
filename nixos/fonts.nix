{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      roboto
      work-sans
      inter
      dejavu_fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.fira-code
      nerd-fonts.meslo-lg
      openmoji-color
      twemoji-color-font
      fira-code
      fira-code-symbols
      font-awesome
      ibm-plex
      jetbrains-mono
      material-icons
    ];

    enableDefaultPackages = false;
  };
}
