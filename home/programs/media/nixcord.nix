{inputs, ...}: {
  imports = [inputs.nixcord.homeModules.nixcord];

  programs.nixcord = {
    enable = true;

    # Choose your Discord mod client (enable at most one of these two)
    #discord.vencord.enable = true;      # Standard Vencord
    discord.equicord.enable = true; # Equicord (has more plugins)

    # Or these
    vesktop.enable = true;
    # dorion.enable = true;
    # legcord.enable = true;

    plugins = {
      hideMedia.enable = true;
      ignoreActivities = {
        enable = true;
        ignorePlaying = true;
        ignoredActivities = [
          {
            id = "game-id";
            name = "League of Legends";
            type = 0;
          }
        ];
      };
    };
  };
}
