{
  pkgs,
  lib,
  ...
}: {
  # Dodajemy narzędzia bezpośrednio do pakietów użytkownika,
  # aby były dostępne globalnie w terminalu (w tym dla 'nix fmt')
  home.packages = with pkgs; [
    nil # LSP dla języka Nix (podpowiadanie kodu, go-to-definition)
    alejandra # Formatter kodu Nix
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = true;

    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions;
          [
            # Git i produktywność
            eamodio.gitlens
            donjayamanne.githistory
            mkhl.direnv

            # Języki, LSP i formatowanie
            bbenoist.nix # Wtyczka Nix-IDE (LSP dla Nix, integracja z Alejandrą)
            jnoortheen.nix-ide
            kamadorueda.alejandra # Wtyczka Alejandry dla VS Code
            jeff-hykin.better-nix-syntax
            arrterian.nix-env-selector
            shd101wyy.markdown-preview-enhanced
            tamasfe.even-better-toml
            mvllow.rose-pine
          ]
          ++ (with pkgs.open-vsx; [
            metaphore.kanagawa-vscode-color-theme
          ]);

        userSettings = {
          "window.titleBarStyle" = "custom";
          "editor.fontSize" = lib.mkForce 17;
          "editor.fontLigatures" = true;
          "editor.minimap.enabled" = false;
          "workbench.colorTheme" = "Kanagawa Wave";
          #"workbench.colorTheme" = "Rosé Pine";

          # --- Integracja z Git ---
          "git.enabled" = true;
          "git.autofetch" = true;
          "git.confirmSync" = false;
          "git.enableSmartCommit" = true;
          "git.decorations.enabled" = true;

          # GitLens
          "gitlens.currentLine.enabled" = true;
          "gitlens.hovers.currentLine.over" = "line";
          "gitlens.codeLens.enabled" = false;

          # --- Ogólne ustawienia formatowania ---
          "editor.formatOnSave" = true; # Formatuj automatycznie przy zapisie pliku
          "editor.tabSize" = 2;
          "editor.insertSpaces" = true;
          "editor.trimTrailingWhitespace" = true;
          "editor.insertFinalNewline" = true;

          # --- Konfiguracja wtyczki Nix-IDE & Alejandra ---
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nil"; # Uruchomienie serwera 'nil'
          "nix.formatterPath" = "alejandra"; # Wskazanie Alejandry jako programu formatującego
          "nix.serverSettings" = {
            "nil" = {
              "formatting" = {
                "command" = ["alejandra"]; # Integracja formatowania wewnątrz LSP
              };
            };
          };

          "[nix]" = {
            "editor.defaultFormatter" = "jnoortheen.nix-ide";
            "editor.formatOnSave" = true;
          };
        };

        keybindings = [
          {
            key = "ctrl+g";
            command = "workbench.view.scm";
          }
        ];
      };
    };
  };
}
