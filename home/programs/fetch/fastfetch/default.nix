{
  pkgs,
  lib,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "~/.config/fastfetch/nixos.png}";
        height = 10;
        width = 22;
        padding = {
          "top" = 2;
          "left" = 2;
        };
      };

      display = {
        separator = "  ";

        color = {
          "keys" = "blue";
        };

        bar = {
          char = {
            "elapsed" = "󰝤";
          };
        };

        percent = {
          "type" = 2;
        };
      };

      modules = [
        {
          "type" = "title";
          "key" = " ";
          # "color" = {
          #   "user" = "light_blue";
          #   "at" = "white";
          #   "host" = "magenta";
          # };
        }
        "break"
        {
          "type" = "os";
          "key" = " ";
        }
        {
          "type" = "kernel";
          "key" = " ";
          "format" = "{1} {2}";
        }
        {
          "type" = "uptime";
          "key" = " 󰅐";
        }
        {
          "type" = "command";
          "key" = " 󰔠";
          "text" = "${lib.getExe pkgs.hourglass}";
        }
        {
          "type" = "command";
          "key" = " ";
          "text" = "${lib.getExe pkgs.hourglass} -s 2026-07-26";
        }

        "break"
        {
          "type" = "host";
          "key" = " 󰾰";
        }
        {
          "type" = "cpu";
          "key" = " 󰻠";
        }

        {
          "type" = "gpu";
          "key" = " 󰍛";
        }

        {
          "type" = "disk";
          "key" = " 󰨣";
          #"format" = "{1} {2}";
        }

        {
          "type" = "memory";
          "key" = " ";
        }
        /*
          {
          "type" = "display";
          "key" = " 󰍹";
        }
        */
        "break"
        {
          "type" = "de";
          "key" = " 󰕮";
        }
        {
          "type" = "wm";
          "key" = " ";
        }
        {
          "type" = "shell";
          "key" = " ";
        }
        {
          "type" = "terminal";
          "key" = " ";
        }
        {
          "type" = "packages";
          "key" = " 󰏖";
        }
        {
          "type" = "editor";
          "key" = " ";
        }
        {
          "type" = "command";
          "key" = " ";
          "text" = "${pkgs.nix-gen}/bin/nix-gen -c";
        }

        "break"
        {
          "type" = "colors";
          "paddingLeft" = "5";
          "symbol" = "star";
        }
      ];
    };
  };
  home.file = {
    ".config/fastfetch/nixos.png".source = ./nixos.png;
    ".config/fastfetch/config1.jsonc".source = ./config1.jsonc;
  };
}
