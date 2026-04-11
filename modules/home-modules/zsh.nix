{config, ...}: {
  home.sessionVariables = {
    userfiles = "${config.home.homeDirectory}/workspace";
  };

  programs.zsh = {
    enable = true;
    defaultKeymap = "vi";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    history = {
      size = 50000;
      save = 50000;
      path = "${config.xdg.stateHome}/zsh/history";
      ignoreDups = true;
      share = true;
    };
    shellAliases = {
      vim = "nvim";
      dots = "cd ${config.home.homeDirectory}/workspace/dotfiles";
      gst = "git st";
      gco = "git co";
      gbr = "git br";
      gci = "git ci";
      gdf = "git df";
      glg = "git lg";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
