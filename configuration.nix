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
    HYPRSHOT_DIR = "/tmp";
    GTK_THEME = "Adwaita-dark";
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  stylix = {
    enable = true;
    image = ./modules/home-modules/0002-doom.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;

  hardware.bluetooth.enable = true;

  system.stateVersion = "23.11";
}
