{
  pkgs,
  config,
  ...
}: let
  cursorShaders = pkgs.fetchFromGitHub {
    owner = "sahaj-b";
    repo = "ghostty-cursor-shaders";
    rev = "06d4e90fb5410e9c4d0b3131584060adddf89406";
    hash = "sha256-G/UIr1bKnxn1AcHl/4FL/jou6b7M2VeREslYVELxdmw=";
  };
  c = config.lib.stylix.colors;
in {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
    enableFishIntegration = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    installVimSyntax = true;
    clearDefaultKeybinds = true;
    settings = {
      term = "xterm-256color";
      theme = "Catppuccin Mocha";
      font-family = "JetBrainsMono NF SemiBold ";
      font-size = 13;
      window-padding-x = 10;
      confirm-close-surface = false;
      window-padding-y = 10;
      clipboard-read = "allow";
      clipboard-write = "allow";
      copy-on-select = "clipboard";
      app-notifications = false;
      background-opacity = "0.80";
      background-blur-radius = "50";
      unfocused-split-opacity = "0.80";
      custom-shader = "${cursorShaders}/cursor_warp.glsl";
      custom-shader-animation = "always";
      shell-integration-features = "cursor,sudo";
      bold-is-bright = "false";
      keybind = [
        # Copy/Paste
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"

        # Font size control
        "ctrl+shift+plus=increase_font_size:1"
        "ctrl+shift+minus=decrease_font_size:1"
        "ctrl+shift+zero=reset_font_size"

        "alt+s>r=reload_config"
        "alt+s>x=close_surface"

        "alt+s>n=new_window"

        # tabs
        "alt+s>c=new_tab"
        "alt+s>shift+l=next_tab"
        "alt+s>shift+h=previous_tab"
        "alt+s>comma=move_tab:-1"
        "alt+s>period=move_tab:1"

        # quick tab switch
        "alt+s>1=goto_tab:1"
        "alt+s>2=goto_tab:2"
        "alt+s>3=goto_tab:3"
        "alt+s>4=goto_tab:4"
        "alt+s>5=goto_tab:5"
        "alt+s>6=goto_tab:6"
        "alt+s>7=goto_tab:7"
        "alt+s>8=goto_tab:8"
        "alt+s>9=goto_tab:9"

        # split
        "alt+s>\\=new_split:right"
        "alt+s>-=new_split:down"

        "alt+s>j=goto_split:bottom"
        "alt+s>k=goto_split:top"
        "alt+s>h=goto_split:left"
        "alt+s>l=goto_split:right"

        "alt+s>z=toggle_split_zoom"

        "alt+s>e=equalize_splits"
      ];
    };
  };
}
