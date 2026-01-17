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
      btop
      calibre
      ctags
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
      httpie-desktop
      hyprshot
      imv
      # jetbrains.idea-community-bin
      jq
      lazygit
      libreoffice
      ngrok
      nodejs_24
      obsidian
      opencode
      pavucontrol
      pnpm
      postman
      protonvpn-gui
      qpwgraph
      ripgrep
      ruff
      slurp
      spotify
      swayidle
      swww
      tealdeer
      tmux
      vesktop
      sd
      vlc
      vscode-fhs
      wine
      wl-clipboard
      zathura
      zip
      zed-editor
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
