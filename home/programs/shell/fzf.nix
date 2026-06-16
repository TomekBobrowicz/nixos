# Fzf is a general-purpose command-line fuzzy finder.
{ config, lib, ... }:
let
  
in {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--margin=1"
      "--layout=reverse"
      "--border=none"
      "--info='hidden'"
      "--header=''"
      "--prompt='/ '"
      "-i"
      "--no-bold"
    ];
  };
}
