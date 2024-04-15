# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      cognusboi = import ./home.nix;
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    useDHCP = false;
    hostName = "nixos";
    networkmanager = {
      enable = true;
      dns = "none";
    };

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
    resolvconf.enable = false;

    stevenblack = {
      enable = false;
      block = ["porn"];
    };
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  fileSystems."/tmp" = {
    fsType = "tmpfs";
  };

  fileSystems."/home/cognusboi/workspace" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      options = "caps:swapescape";
    };

    displayManager = {
      defaultSession = "none+i3";
      autoLogin = {
        enable = true;
        user = "cognusboi";
      };
      lightdm = {
        enable = true;
        greeter.enable = false;
        autoLogin = {
          timeout = 0;
        };
      };
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };

  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cognusboi = {
    isNormalUser = true;
    description = "Sabyasachi Bhoi";
    extraGroups = ["networkmanager" "wheel" "audio" "video" "storage" "render"];
    packages = with pkgs; [
    ];
    shell = pkgs.fish;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    arandr
    bat
    brightnessctl
    clang-tools
    dunst
    firefox
    gcc12
    git
    home-manager
    keepassxc
    killall
    libnotify
    man-pages
    mpv
    neovim
    nnn
    pamixer
    polybar
    python3
    stow
    unzip
    usbutils
    xclip
    xfce.thunar
  ];

  location = {
    latitude = 17.38;
    longitude = 78.48;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.steam.enable = true;

  fonts.packages = with pkgs; [
    corefonts
    vistafonts
    noto-fonts
    roboto
    (nerdfonts.override {fonts = ["Iosevka" "FiraCode" "JetBrainsMono" "Meslo" "Inconsolata" "RobotoMono"];})
  ];

  security.rtkit.enable = true;

  hardware.bluetooth.enable = true;

  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    picom = {
      enable = true;
      shadow = true;
      fade = true;
      fadeDelta = 3;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  };

  systemd = {
    timers."wallpaper-change" = {
      wantedBy = ["timers.target"];
      timerConfig = {
        OnBootSec = "5";
        OnUnitActiveSec = "30m";
        Unit = "wallpaper-change.service";
      };
    };
    services."wallpaper-change" = {
      serviceConfig = {
        Type = "oneshot";
        User = "cognusboi";
      };
      path = [
        pkgs.feh
      ];
      script = let
        python = pkgs.python3.withPackages (ps: with ps; [pillow]);
      in ''
        cd /home/cognusboi/workspace/programming/python/wallpaper/
        ${python}/bin/python app.py
      '';
    };
    services."network-login" = {
      script = ''
        /home/cognusboi/scripts/login
      '';
      serviceConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
    };
  };

  xdg.mime.defaultApplications = {
    "application/pdf" = "org.pwmt.zathura.desktop";
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
    "application/vnd.oasis.opendocument.text" = "writer.desktop";
    "image/jpeg" = "imv.desktop";
    "image/png" = "imv.desktop";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
