{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
    [
      audacity
      baobab
      brave
      btop
      calibre
      code-cursor
      ctags
      dconf
      fd
      feh
      ffmpeg
      fh
      firefox
      font-awesome
      fzf
      gdb
      gimp
      gnome-font-viewer
      grim
      guvcview
      hyprshot
      jetbrains.idea-community-bin
      imv
      lazygit
      libreoffice
      # nodejs_24
      ngrok
      obsidian
      pavucontrol
      postman
      qpwgraph
      ripgrep
      ruff
      slurp
      sqlitebrowser
      steam-run
      swayidle
      swww
      tealdeer
      vesktop
      vlc
      vscode-fhs
      whatsapp-for-linux
      wine
      wl-clipboard
      zathura
      zip
      zoom-us
    ]
    ++ [
      (import ../scripts/fonts.nix {inherit pkgs;})
      (import ../scripts/m720.nix {inherit pkgs;})
      (import ../scripts/m1080.nix {inherit pkgs;})
      (import ../scripts/rebuild.nix {inherit pkgs;})
      (import ../scripts/update.nix {inherit pkgs;})
    ];

  programs = {
    java = {
      enable = true;
      # package = pkgs.oraclejdk8;
    };
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
      package = pkgs.rofi-wayland;
      extraConfig = {
        display-drun = "Applications: ";
        modi = "window,run,drun";
      };
    };
    direnv = {
      enable = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };
    yazi = {
      enable = false;
      enableFishIntegration = true;
    };
    waybar.enable = true;
    swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
    };
    eza = {
      enable = true;
      icons = "auto";
    };
    home-manager.enable = true;
  };
}
