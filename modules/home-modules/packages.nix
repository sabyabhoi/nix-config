{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
    [
      handy
      nmap
      ardour
      awww
      # brave
      btop
      # calibre
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
      godot
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
      niri
      noctalia-shell
      nodejs_24
      obsidian
      pavucontrol
      pnpm
      postman
      prismlauncher
      proton-vpn
      qbittorrent
      qpwgraph
      ripgrep
      ruff
      sd
      slurp
      spotify
      swayidle
      tealdeer
      tmux
      vesktop
      vlc
      vscode-fhs
      vulkan-tools
      wine
      wl-clipboard
      zathura
      # zed-editor
      zip
      tiled
    ]
    ++ [
      (import ../scripts/fonts.nix {inherit pkgs;})
      (import ../scripts/rebuild.nix {inherit pkgs;})
      (import ../scripts/clean.nix {inherit pkgs;})
      (import ../scripts/update.nix {inherit pkgs;})
    ];

  gtk = {
    enable = true;
    colorScheme = "dark";
  };

  programs = {
    codex = {
      enable = true;
    };
    brave = {
      enable = true;
      commandLineArgs = [
        "-enable-features=UseOzonePlatform"
        "-ozone-platform=wayland"
      ];
    };
    vicinae = {
      enable = true;
      systemd = {
        enable = true;
      };
    };
    opencode = {
      enable = true;
      settings = {
        permission = {
          webfetch = "allow";
        };
      };
    };
    java = {
      enable = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    firefox = {
      enable = false;
    };
    direnv = {
      enable = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };
    waybar.enable = true;
    eza = {
      enable = true;
      icons = "auto";
    };
    home-manager.enable = true;
  };
}
