{
  inputs,
  config,
  pkgs,
  ...
}: let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
  });
in {
  imports = [
    ./modules/nnn.nix
    ./modules/kitty.nix
    # inputs.nixvim.homeManagerModules.nixvim
    # ./modules/nixvim
  ];
  home.username = "cognusboi";
  home.homeDirectory = "/home/cognusboi";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
    [
      (bumblebee-status.override {plugins = p: [p.title p.indicator p.pipewire p.battery p.datetime p.system];})
      btop
      brave
      calibre
      ctags
      # codeium
      dconf
      discord
      element-desktop
      feh
      ffmpeg
      flameshot
      fzf
      gdb
      gimp
      gnome.gnome-font-viewer
      gum
      guvcview
      imv
      lazygit
      libreoffice
      lxappearance
      ncdc
      nodePackages.nodejs
      obsidian
      pavucontrol
      ripgrep
      rstudio
      ruff
      sioyek
      tealdeer
      tree
      typst
      vscode
      wine
      zathura
      zip
      zoom-us
      zotero
    ]
    ++ [
      (import ./scripts/fonts.nix {inherit pkgs;})
      (import ./scripts/m720.nix {inherit pkgs;})
      (import ./scripts/m1080.nix {inherit pkgs;})
      (import ./scripts/rebuild.nix {inherit pkgs;})
    ];

  services = {
    udiskie.enable = true;
    gammastep = {
      enable = true;
      provider = "manual";
      latitude = 17.38;
      longitude = 78.48;
    };
  };

  programs = {
    git = {
      enable = true;
      userName = "sabyabhoi";
      userEmail = "sabyabhoi@gmail.com";
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    rofi = {
      enable = true;
      theme = "Arc-Dark";
    };
    direnv = {
      enable = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };
    zellij = {
      enable = true;
      enableFishIntegration = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  xdg.desktopEntries = {
    m720 = {
      name = "m720";
      terminal = false;
      exec = "/home/cognusboi/.nix-profile/bin/m720";
    };
    m1080 = {
      name = "m1080";
      terminal = false;
      exec = "/home/cognusboi/.nix-profile/bin/m1080";
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/cognusboi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
