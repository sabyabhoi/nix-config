{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./modules/home-modules/nnn.nix
    ./modules/home-modules/zellij.nix
    ./modules/home-modules/stylix.nix
    ./modules/home-modules/kitty.nix
    # ./modules/home-modules/lf.nix
    ./modules/home-modules/dunst.nix
    # ./modules/home-modules/ghostty.nix
    ./modules/home-modules/packages.nix
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/home-modules/nixvim
  ];
  home.username = "cognusboi";
  home.homeDirectory = "/home/cognusboi";

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
