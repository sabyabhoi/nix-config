{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.android_sdk.accept_license = true;

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
    steam = {
      enable = true;
      protontricks.enable = true;
    };
    hyprland.enable = true;
    thunar.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # android-tools
    # androidenv.androidPkgs.androidsdk
    arandr
    bat
    bluez
    bluez-tools
    brightnessctl
    # busybox
    clang-tools
    coreutils-full
    gcc13
    git
    home-manager
    iproute2
    keepassxc
    killall
    libnotify
    man-pages
    mpv
    # nnn
    pamixer
    python3
    python311Packages.ptpython
    stow
    unrar
    unzip
    usbutils
    wget
    xclip
    # (pkgs.androidenv.emulateApp {
    #   name = "emulate-MyAndroidApp";
    #   platformVersion = "36";
    #   abiVersion = "x86_64"; # armeabi-v7a, mips, x86_64
    #   systemImageType = "google_apis_playstore";
    # })
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
