{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userEmail = "15682036+nmeusling@users.noreply.github.com";
    userName = "nmeusling";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      share = true;
      save = 10000;
      size = 10000;
    };

    initExtra = ''
      setopt HIST_SAVE_NO_DUPS
      setopt HIST_FIND_NO_DUPS
    '';

    oh-my-zsh = {
      enable = true;
      # theme = "bureau";
      plugins = [
        "git"
        "git-auto-fetch"
      ];
    };
  };

  programs.vscode = {
    enable = true;

    # do not let VSCode alter the folder, only Home-Manager
    mutableExtensionsDir = false;

    # disable checking for remote updates
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    extensions = with pkgs.vscode-extensions; [
      charliermarsh.ruff
      codezombiech.gitignore
      dracula-theme.theme-dracula
      jnoortheen.nix-ide
      mikestead.dotenv
      ms-python.python
      redhat.vscode-yaml
      streetsidesoftware.code-spell-checker
      tamasfe.even-better-toml
      timonwong.shellcheck
      vscode-icons-team.vscode-icons
      vscodevim.vim
      waderyan.gitblame
      yzhang.markdown-all-in-one
    ];

    userSettings = {
      # ui
      "window.menuBarVisibility" = "toggle";
      "workbench.colorTheme" = "Dracula Soft";
      "workbench.iconTheme" = "vscode-icons";

      # editor
      "editor.rulers" = [ 80 120 ];
      "editor.fontFamily" = "'JetBrainsMono NF', 'monospace'";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "editor.inlineSuggest.enabled" = true;
      "editor.codeActionsOnSave" = {
        "source.organizeImports.ruff" = "explicit";
      };

      # languages
      "[python]" = { "editor.defaultFormatter" = "charliermarsh.ruff"; };
      "[markdown]" = { "editor.defaultFormatter" = "yzhang.markdown-all-in-one"; };

      "git.inputValidationLength" = 72;
      "git.inputValidationSubjectLength" = 50;
      "[git-commit]" = {
        "editor.rulers" = [ 72 50 ];
        "editor.wordWrap" = "off";
        "workbench.editor.restoreViewState" = false;
      };

    };
  };
}
