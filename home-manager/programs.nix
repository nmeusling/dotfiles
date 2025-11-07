{pkgs, ...}: {
  programs = {
    direnv.enable = true;

    lazygit.enable = true;

    zoxide = {
      enable = true;
      enableZshIntegration = true;

      options = [
        "--cmd"
        "cd"
      ];
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "15682036+nmeusling@users.noreply.github.com";
    userName = "nmeusling";
    extraConfig = {
      init.defaultBranch = "main";
    };
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
      theme = "bureau";
      plugins = [
        "git"
        "git-auto-fetch"
      ];
    };
  };

  programs.ghostty = {
    enable = true;

    enableZshIntegration = true;
    # installVimSyntax = true;
    settings = {
      theme = "";
      font-size = 10;
      title = " ";
      # window-decoration = false;
    };
  };
}
