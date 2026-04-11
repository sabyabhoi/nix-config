{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
    [
      godot
      niri
      noctalia-shell
      ardour
      # brave
      btop
      # calibre
      ctags
      dconf
      delta
      fd
      qbittorrent
      feh
      ffmpeg
      fh
      font-awesome
      gdb
      gdu
      gimp
      gnome-font-viewer
      grim
      # guitarix
      # guvcview
      httpie-desktop
      hyprshot
      imv
      # jetbrains.idea-community-bin
      jq
      lazygit
      # libreoffice
      ngrok
      nodejs_24
      obsidian
      pavucontrol
      pnpm
      postman
      prismlauncher
      proton-vpn
      qpwgraph
      ripgrep
      ruff
      sd
      slurp
      spotify
      swayidle
      awww
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
      enableZshIntegration = true;
    };
    firefox = {
      enable = true;
      profiles = {
        my-profile = {};
      };
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
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
