{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [inputs.niri.nixosModules.niri];

  niri-flake.cache.enable = true;

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  programs.uwsm = {
    enable = false;
    waylandCompositors.niri = {
      prettyName = "Niri";
      comment = "Niri compositor managed by UWSM";
      binPath = pkgs.writeShellScript "niri" ''
        ${lib.getExe config.programs.niri.package} --session
      '';
    };
  };
}
