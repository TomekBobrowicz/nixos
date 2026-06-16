{
  config,
  pkgs,
  ...
}: let
  username = config.var.username;
in {
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      description = "Tomek Bobrowicz";
      extraGroups = ["networkmanager" "wheel"];
    };
  };
}
