{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  programs = {
    sway = {
      enable = false;
      package = pkgs.swayfx;
      wrapperFeatures.gtk = true;
    };
    fish.enable = true;
    neovim = {
      enable = false;
      defaultEditor = false;
    };
    git = {
      enable = true;
      config = {
        user = {
          name = "Sabyasachi Bhoi";
          email = "sabyabhoi@gmail.com";
        };
        core.pager = "delta";
        interactive.diffFilter = "delta --color-only";
        delta = {
          navigate = true;
          dark = true;
        };
        merge.conflictstyle = "zdiff3";
      };
    };
    steam.enable = false;
    hyprland.enable = true;
    thunar.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    arandr
    bat
    brightnessctl
    busybox
    clang-tools
    gcc13
    git
    home-manager
    iproute2
    keepassxc
    killall
    libnotify
    man-pages
    mpv
    nnn
    pamixer
    python3
    python311Packages.ptpython
    stow
    unrar
    unzip
    usbutils
    xclip
  ];

  fonts.packages = with pkgs; [
    crimson-pro
    poppins
    corefonts
    vista-fonts
    noto-fonts
    roboto
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.inconsolata
    nerd-fonts.roboto-mono
  ];
}
