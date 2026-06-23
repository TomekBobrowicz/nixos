{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri.nixosModules.default];
  nixpkgs.overlays = [inputs.niri.overlays.niri-nix];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
}
