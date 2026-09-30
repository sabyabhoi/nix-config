{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  # logseq depends on an EOL electron
  nixpkgs.config.permittedInsecurePackages = ["electron-39.8.10"];

  home.packages = with pkgs;
    [
      ardour
      awww
      # beyond-all-reason
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
      firefox
      font-awesome
      fzf
      gdb
      gdu
      gimp
      gnome-font-viewer
      # godot
      grim
      guitarix
      # guvcview
      guvcview
      handy
      # httpie-desktop
      hyprshot
      imv
      # jetbrains.idea-community-bin
      jq
      lazygit
      libreoffice
      logseq
      ngrok
      # niri
      nmap
      # noctalia-shell
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
      # tiled
      tmux
      vesktop
      vlc
      vscode-fhs
      vulkan-tools
      wine
      wl-clipboard
      zathura
      zed-editor
      # zeroad
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
    brave = {
      enable = true;
    };
    vicinae = {
      enable = true;
      systemd = {
        enable = true;
        autoStart = true;
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
