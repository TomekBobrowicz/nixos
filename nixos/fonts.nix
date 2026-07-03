{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      inter
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      jetbrains-mono
      maple-mono.NF # Maple Mono, patched with Nerd Font glyphs (mono default).
    ];

    enableDefaultPackages = false;
    fontconfig.defaultFonts = {
      monospace = ["Maple Mono NF"];
      sansSerif = ["Noto Sans"];
      serif = ["Noto Serif"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
