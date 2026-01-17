{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./modules/home-modules/nnn.nix
    ./modules/home-modules/hyprland.nix
    ./modules/home-modules/zellij.nix
    ./modules/home-modules/stylix.nix
    ./modules/home-modules/kitty.nix
    # ./modules/home-modules/lf.nix
    ./modules/home-modules/dunst.nix
    # ./modules/home-modules/ghostty.nix
    ./modules/home-modules/packages.nix
    inputs.nixvim.homeModules.nixvim
    ./modules/home-modules/nixvim
  ];
  home.username = "sabyabhoi";
  home.homeDirectory = "/home/sabyabhoi";

  home.stateVersion = "23.11";

  services = {
    # udiskie.enable = true;
    gammastep = {
      enable = true;
      provider = "manual";
      latitude = 17.38;
      longitude = 78.48;
    };
    batsignal.enable = true;
  };

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };
}
