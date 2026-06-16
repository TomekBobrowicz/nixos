{
  pkgs,
  lib,
  ...
}: {
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      # other styles available and cane be combined
      #  style = "numbers,changes,headers,rule,grid";
      style = "full";
      # Bat has other thems as well
      # ansi,Catppuccin,base16,base16-256,GitHub,Nord,etc
      theme = lib.mkForce "Rose Pine"; # "OneHalfDark" | "OneHalfLight" | "Nord" | "Dracula" | "Monokai Extended" | "Roses Pine" | "Catppuccin-Mocha" | "Catppuccin-Latte" | "Catppuccin-Frappe"
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      #batgrep   # Fails to build 10-20-25
    ];
  };
  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
}
