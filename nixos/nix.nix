{
  config,
  inputs,
  ...
}: let
  autoGarbageCollector = config.var.autoGarbageCollector;
in {
  security.sudo.extraRules = [
    {
      users = [config.var.username];
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    channel.enable = true;
    extraOptions = ''
      warn-dirty = false
      !include "${home}/.config/sops/github_token";

    '';

    settings = {
      download-buffer-size = 262144000; # 250 MB (250 * 1024 * 1024)
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = [
        # high priority since it's almost always used
        "https://cache.nixos.org"
        "https://aseipp-nix-cache.freetls.fastly.net?priority=10"
        "https://nix-community.cachix.org"
        "https://numtide.cachix.org"
        "https://noctalia.cachix.org"
        "https://niri.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        "niri.cachix.org-1:Wv03N9b7X/T1qg17v7yAnE00d9gscT3S67i1W6rMPrU="
      ];
    };
    gc = {
      automatic = autoGarbageCollector;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
