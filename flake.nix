{
  description = ''Simple NixOS Niri Noctalia flake  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nvf.url = "github:notashelf/nvf";
    hourglass = {
      url = "gitlab:Alxhr0/hourglass";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    catppuccin.url = "github:catppuccin/nix";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = inputs @ {nixpkgs, ...}: {
    nixosConfigurations = {
      thinkpad =
        # CHANGEME: This should match the 'hostname' in your variables.nix file
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            {
              nixpkgs.overlays = [inputs.niri.overlays.niri];
            }
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t460 # CHANGEME: check https://github.com/NixOS/nixos-hardware
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix

            ./hosts/thinkpad/configuration.nix # CHANGEME: change the path to match your host folder
          ];
        };

      nixpad =
        # CHANGEME: This should match the 'hostname' in your variables.nix file
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            {
              nixpkgs.overlays = [
                inputs.niri.overlays.niri
              ];
            }
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen1 # CHANGEME: check https://github.com/NixOS/nixos-hardware
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix

            ./hosts/nixpad/configuration.nix # CHANGEME: change the path to match your host folder
            inputs.sops-nix.nixosModules.sops
          ];
        };
    };
  };
}
