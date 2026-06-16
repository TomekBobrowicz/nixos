{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia = {
    enable = true;
    settings = {
      location.auto_locate = true;
      dock.enabled = false;
      shell = {
        polkit_agent = true;
      };
      bar = {
        density = "default";
        position = "top";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "Wallpaper";
            }
            {
              id = "Workspace";
              labelMode = "none";
              hideUnoccupied = false;
            }
          ];
          center = [
            {
              id = "Clock";
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              useMonospacedFont = true;
            }
          ];
          right = [
            {
              id = "Tray";
              showCapsule = false;
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "Caffeine";
            }
            {
              id = "Clipboard";
            }
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "Battery";
            }
            {
              id = "Brightness";
            }
            {
              id = "Volume";
            }
            {
              id = "SystemMonitor";
              compactMode = false;
              diskPath = "/";
              showCpuTemp = false;
              showCpuUsage = true;
              showDiskUsage = false;
              showGpuTemp = false;
              showLoadAverage = false;
              showMemoryAsPercent = true;
              showMemoryUsage = true;
              showNetworkStats = true;
              useMonospaceFont = true;
              usePrimaryColor = true; # use accent color
            }
            {
              id = "SessionMenu";
              iconColor = "error";
            }
          ];
        }; 
      };
    };
    settings.theme.templates = {
      enable_builtin_templates = true;
      builtin_ids = [
        "ghostty"
        "kitty"
        "niri"
        #"starship"
      ];
    };
  };
}
