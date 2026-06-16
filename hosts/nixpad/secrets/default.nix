# Those are my secrets, encrypted with sops
# You shouldn't import this file, unless you edit it
{
  inputs,
  pkgs,
  config,
  ...
}: let
  home = config.home.homeDirectory;
in {
  imports = [inputs.sops-nix.homeManagerModules.sops];

  sops = {
    #age.keyFile = "${home}/.config/sops/age/keys.txt";
    age.keyFile = "/var/lib/sops-nix/key.txt";
    age.sshKeyPaths = ["${home}/.ssh/key"];
    defaultSopsFile = ./secrets.yaml;
    secrets = {
      signing-key = {
        path = "${home}/.ssh/key";
        mode = "0600";
      };
      signing-pub-key = {
        path = "${home}/.ssh/key.pub";
        mode = "0644";
      };
      github_token = {
        path = "/run/secrets/github_token";
      };
    };
  };

  home.file.".config/nixos/.sops.yaml".text = ''
    keys:
      - &primary  age1376qcjauy85nyguaq636lh44e4c5qwph2dgjftklnm85fa4wxq7qy9ylc8

    creation_rules:
      - path_regex: hosts/nixpad/secrets/secrets.yaml$
        key_groups:
          - age:
            - *primary
  '';

  systemd.user.services.mbsync.Unit.After = ["sops-nix.service"];
  home.packages = with pkgs; [
    sops
    age
  ];

  wayland.windowManager.hyprland.settings.exec-once = ["systemctl --user start sops-nix"];
}
