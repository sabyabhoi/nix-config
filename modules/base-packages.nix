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
    steam.enable = true;
    hyprland.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    arandr
    bat
    brightnessctl
    busybox
    clang-tools
    gcc12
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
    xfce.thunar
  ];

  fonts.packages = with pkgs; [
    poppins
    corefonts
    vistafonts
    noto-fonts
    roboto
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.inconsolata
    nerd-fonts.roboto-mono
  ];
}
