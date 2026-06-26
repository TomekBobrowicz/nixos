{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Mostly system related configuration
    ../../nixos/audio.nix
    ../../nixos/amd.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/greeter.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/niri.nix

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];
  nixpkgs = {
    overlays = [inputs.asteroid.overlays.default];
  };
  system.activationScripts.script.text = ''
    mkdir -p /var/lib/AccountsService/{icons,users}

     set -eu
             for user in /home/*; do
                 username=$(basename "$user")
                 if [ -f "$user/.face.icon" ]; then
                     if [ ! -f "/var/lib/AccountsService/icons/$username" ]; then
                         cp "$user/.face.icon" "/var/lib/AccountsService/icons/$username"
                     else
                         if [ "$user/.face.icon" -nt "/var/lib/AccountsService/icons/$username" ]; then
                             cp "$user/.face.icon" "/var/lib/AccountsService/icons/$username"
                         fi
                     fi
                 fi
             done

  '';
  services.accounts-daemon.enable = true;
  stylix.targets.chromium.enable = false;
  stylix.enableReleaseChecks = false;

  home-manager.users."${config.var.username}" = import ./home.nix;
  environment = {
    systemPackages = with pkgs; [
      hourglass
      nix-gen
    ];
  };
  # Don't touch this
  system.stateVersion = "26.05";
}
