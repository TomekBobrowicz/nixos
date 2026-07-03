{pkgs, ...}: let
  rosePineBtop = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "btop";
    rev = "6d6abdc";
    hash = "sha256-sShQYfsyR5mq/e+pjeIsFzVZv3tCpQEdGC9bnTKlQ5c=";
  };
in {
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    settings = {
      vim_keys = true;
      rounded_corners = true;
      proc_tree = true;
      show_gpu_info = "on";
      show_uptime = true;
      show_coretemp = true;
      cpu_sensor = "auto";
      show_disks = true;
      only_physical = true;
      io_mode = true;
      io_graph_combined = false;
      color_theme = "noctalia";
    };
  };
}
