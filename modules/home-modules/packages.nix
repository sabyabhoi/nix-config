{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
    [
      brave
      btop
      # calibre
      ctags
      dconf
      discord
      element-desktop
      fd
      feh
      ffmpeg
      firefox
      flameshot
      font-awesome
      fzf
      gdb
      geist-font
      gimp
      gnome-font-viewer
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
      steam
      steam-run
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
    eza = {
      enable = true;
      icons = "auto";
    };
    home-manager.enable = true;
  };
}
