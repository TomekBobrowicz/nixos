{
  config,
  lib,
  ...
}: {
  imports = [
    ../../themes/catppuccin.nix
  ];

  config.var = {
    hostname = "thinkpad";
    username = "buber";
    description = "Tomek Bobrowicz";
    configDirectory =
      "/home/"
      + config.var.username
      + "/.config/nix"; # The path of the nixos configuration directory

    keyboardLayout = "pl";

    location = "Warsaw";
    timeZone = "Europe/Warsaw";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "pl_PL.UTF-8";

    git = {
      username = "Buber82";
      email = "bobrowicz.tomek@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
