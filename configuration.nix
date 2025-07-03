{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ./modules/services.nix
    ./modules/xdg.nix
    ./modules/network.nix
    ./modules/locale.nix
    ./modules/systemd-timers.nix
    ./modules/base-packages.nix
    ./modules/virtualization.nix
    ./modules/stylix.nix
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      cognusboi = import ./home.nix;
    };
  };

  # Bootloader.
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 5;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  fileSystems."/tmp" = {
    fsType = "tmpfs";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cognusboi = {
    isNormalUser = true;
    description = "Sabyasachi Bhoi";
    extraGroups = ["networkmanager" "wheel" "audio" "video" "storage" "render" "docker" "libvirtd" "kvm"];
    packages = [];
    shell = pkgs.fish;
  };

  environment.sessionVariables = rec {
    VDPAU_DRIVER = "va_gl";
    LIBVA_DRIVER_NAME = "iHD";

    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    HYPRSHOT_DIR = "/tmp";
    GTK_THEME = "Adwaita-dark";
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
    VISUAL = "nvim";
    ELECTRON_FLAGS = "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --ozone-platform=wayland";

    CARGO_HOME = "${XDG_DATA_HOME}/cargo";
    DOCKER_CONFIG = "${XDG_CONFIG_HOME}/docker";
    _JAVA_OPTIONS = "-Djavafx.cachedir=${XDG_CACHE_HOME}/openjfx";
  };

  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;

  hardware.bluetooth.enable = true;

  system.stateVersion = "23.11";
}
