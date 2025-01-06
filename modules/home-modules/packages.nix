{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
    [
      audacity
      brave
      btop
      calibre
      ctags
      dconf
      fd
      feh
      ffmpeg
      firefox
      flameshot
      font-awesome
      fzf
      gdb
      gimp
      gnome-font-viewer
      grim
      godot_4
      guvcview
      postman
      hyprshot
      imv
      lazygit
      libreoffice
      lxappearance
      nodePackages.nodejs
      obsidian
      pavucontrol
      ripgrep
      ruff
      sioyek
      slurp
      steam-run
      swayidle
      swww
      tealdeer
      typst
      vesktop
      vlc
      vscode
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
    zellij = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        default_layout = "compact";
        pane_frames = false;
      };
    };
    yazi = {
      enable = true;
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
