{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Mostly system related configuration
    ../../nixos/audio.nix
    ../../nixos/intel.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/niri.nix
    ../../nixos/noctalia.nix
    ../../nixos/greeter.nix

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];
  nixpkgs = {
    overlays = [inputs.asteroid.overlays.default];
  };
  home-manager.users."${config.var.username}" = import ./home.nix;
  environment = {
    systemPackages = with pkgs; [
      hourglass
      nix-gen
    ];
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

       chown root:root /var/lib/AccountsService/users/buber
       chmod 0600 /var/lib/AccountsService/users/buber

       chown root:root /var/lib/AccountsService/icons/buber
       chmod 0444 /var/lib/AccountsService/icons/buber
  '';

  services.accounts-daemon.enable = true;
  # Don't touch this
  system.stateVersion = "24.05";
}
