{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.android_sdk.accept_license = true;

  home.packages = with pkgs;
    [
      brave
      protonvpn-gui
      btop
      httpie-desktop
      ctags
      calibre
      dconf
      delta
      devenv
      fd
      feh
      ffmpeg
      fh
      font-awesome
      fzf
      gdb
      gdu
      gimp
      gnome-font-viewer
      grim
      guitarix
      # guvcview
      hyprshot
      imv
      # jetbrains.idea-community-bin
      jq
      lazygit
      libreoffice
      ngrok
      nodejs_24
      pnpm
      obsidian
      opencode
      pavucontrol
      postman
      qpwgraph
      ripgrep
      ruff
      slurp
      steam-run
      swayidle
      swww
      tealdeer
      tmux
      vesktop
      vlc
      vscode-fhs
      wine
      wl-clipboard
      zathura
      zip
    ]
    ++ [
      (import ../scripts/fonts.nix {inherit pkgs;})
      (import ../scripts/m720.nix {inherit pkgs;})
      (import ../scripts/m1080.nix {inherit pkgs;})
      (import ../scripts/rebuild.nix {inherit pkgs;})
      (import ../scripts/clean.nix {inherit pkgs;})
      (import ../scripts/update.nix {inherit pkgs;})
    ];

  programs = {
    java = {
      enable = true;
      # package = pkgs.oraclejdk8;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    firefox = {
      enable = true;
      profiles = {
        my-profile = {};
      };
    };
    rofi = {
      enable = true;
      # package = pkgs.rofi-wayland;
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
      enable = false;
      package = pkgs.swaylock-effects;
    };
    eza = {
      enable = true;
      icons = "auto";
    };
    home-manager.enable = true;
  };
}
