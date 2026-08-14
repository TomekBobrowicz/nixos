{
  description = ''Simple NixOS Niri Noctalia flake  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
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

    kineticwe = {
      url = "gitlab:theblackdon/kineticwe";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "git+https://codeberg.org/BANanaD3V/niri-nix";

    noctalia.url = "github:noctalia-dev/noctalia/cachix";

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    catppuccin.url = "github:catppuccin/nix";
    sops-nix.url = "github:Mic92/sops-nix";
    asteroid = {
      url = "gitlab:alxhr0/asteroid";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = inputs @ {nixpkgs, ...}: {
    nixosConfigurations = {
      thinkpad =
        # CHANGEME: This should match the 'hostname' in your variables.nix file
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t460 # CHANGEME: check https://github.com/NixOS/nixos-hardware
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            inputs.sops-nix.nixosModules.sops

            ./hosts/thinkpad/configuration.nix # CHANGEME: change the path to match your host folder
            {nixpkgs.overlays = [inputs.nix-vscode-extensions.overlays.default];}
          ];
        };

      darkside =
        # CHANGEME: This should match the 'hostname' in your variables.nix file
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen1 # CHANGEME: check https://github.com/NixOS/nixos-hardware
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix

            ./hosts/darkside/configuration.nix # CHANGEME: change the path to match your host folder
            {nixpkgs.overlays = [inputs.nix-vscode-extensions.overlays.default];}
            inputs.sops-nix.nixosModules.sops
          ];
        };
      fury =
        # CHANGEME: This should match the 'hostname' in your variables.nix file
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            inputs.nixos-hardware.nixosModules.gigabyte-b550 # CHANGEME: check https://github.com/NixOS/nixos-hardware
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix

            ./hosts/fury/configuration.nix # CHANGEME: change the path to match your host folder
            {nixpkgs.overlays = [inputs.nix-vscode-extensions.overlays.default];}
            inputs.sops-nix.nixosModules.sops
          ];
        };
    };
  };
}
