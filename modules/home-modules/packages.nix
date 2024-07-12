{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
    [
      bibata-cursors
      brave
      btop
      (bumblebee-status.override {plugins = p: [p.title p.indicator p.pipewire p.battery p.datetime p.system];})
      calibre
      ctags
      firefox
      dconf
      discord
      element-desktop
      feh
      ffmpeg
      fh
      flameshot
      font-awesome
      fzf
      gdb
      gimp
      gnome.gnome-font-viewer
      grim
      gum
      guvcview
      hyprshot
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
      slurp
      swayidle
      swww
      tealdeer
      tree
      typst
      vlc
      vscode
      wine
      wl-clipboard
      zathura
      zed-editor
      zip
      zoom-us
      zotero
    ]
    ++ [
      (import ../scripts/fonts.nix {inherit pkgs;})
      (import ../scripts/m720.nix {inherit pkgs;})
      (import ../scripts/m1080.nix {inherit pkgs;})
      (import ../scripts/rebuild.nix {inherit pkgs;})
    ];

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
      package = pkgs.rofi-wayland;
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
    yazi = {
      enable = true;
      enableFishIntegration = true;
    };
    waybar.enable = true;
    swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
    };
    home-manager.enable = true;
  };
}
