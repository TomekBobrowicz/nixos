{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
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
