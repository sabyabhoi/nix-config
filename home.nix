{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/home-modules/nnn.nix
    ./modules/home-modules/kitty.nix
    ./modules/home-modules/packages.nix
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/nixvim
  ];
  home.username = "cognusboi";
  home.homeDirectory = "/home/cognusboi";

  home.stateVersion = "23.11";

  services = {
    udiskie.enable = true;
    gammastep = {
      enable = true;
      provider = "manual";
      latitude = 17.38;
      longitude = 78.48;
    };
  };

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };
}
