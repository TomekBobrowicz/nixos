# home/programs/keepassxc/default.nix
{pkgs, ...}: {
  programs.keepassxc = {
    enable = true;
    package = pkgs.keepassxc;

    settings = {
      General = {
        MinimizeOnClose = true;
        MinimizeOnStartup = true;
      };
      GUI = {
        ApplicationTheme = "dark";
        TrayIconAppearance = "monochrome-light";
      };
      Security = {
        ClearClipboardTimeout = 15;
        LockDatabaseIdle = true;
        LockDatabaseIdleSeconds = 300;
        LockDatabaseMinimize = true;
      };
      Browser = {
        Enabled = true; # enables the native messaging host for keepassxc-browser
      };
    };
  };
}
