{
  pkgs,
  callPackage,
  ...
}: let
  ms-playwright = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      publisher = "ms-playwright";
      name = "playwright";
      version = "1.1.16";
      hash = "sha256-t5PJtBDkjh80IhOpfjsX8kZCSfhGoQ1dePEYMYgw66c=";
    };
  };
in {
  programs.vscode = {
    enable = true;

    # do not let VSCode alter the folder, only Home-Manager
    mutableExtensionsDir = false;

    profiles.default = {
      # disable checking for remote updates
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = with pkgs.vscode-extensions; [
        ms-playwright
        charliermarsh.ruff
        codezombiech.gitignore
        dracula-theme.theme-dracula
        golang.go
        jnoortheen.nix-ide
        mikestead.dotenv
        ms-python.python
        ms-python.debugpy
        redhat.vscode-yaml
        streetsidesoftware.code-spell-checker
        tamasfe.even-better-toml
        timonwong.shellcheck
        vscode-icons-team.vscode-icons
        vscodevim.vim
        waderyan.gitblame
        james-yu.latex-workshop
        yzhang.markdown-all-in-one
        vue.volar
      ];

      userSettings = {
        # ui
        "window.menuBarVisibility" = "toggle";
        "workbench.colorTheme" = "Dracula Soft";
        "workbench.iconTheme" = "vscode-icons";

        # editor
        "editor.rulers" = [80 120];
        "editor.fontFamily" = "'JetBrainsMono NF', 'monospace'";
        "editor.fontLigatures" = true;
        "editor.lineNumbers" = "relative";
        "editor.formatOnSave" = true;
        "editor.inlineSuggest.enabled" = true;
        "editor.codeActionsOnSave" = {
          "source.organizeImports.ruff" = "explicit";
        };

        # languages
        "[python]" = {"editor.defaultFormatter" = "charliermarsh.ruff";};
        "[markdown]" = {"editor.defaultFormatter" = "yzhang.markdown-all-in-one";};
        "nix.formatterPath" = "${pkgs.alejandra}/bin/alejandra";
        "git.inputValidationLength" = 72;
        "git.inputValidationSubjectLength" = 50;
        "[git-commit]" = {
          "editor.rulers" = [72 50];
          "editor.wordWrap" = "off";
          "workbench.editor.restoreViewState" = false;
        };
      };
    };
  };
}
