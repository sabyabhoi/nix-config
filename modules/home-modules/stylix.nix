{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;

    polarity = "dark";

    targets = {
      fish.enable = false;
      neovim.enable = false;
      nixvim.enable = false;
      waybar = {
        enable = false;
      };
      firefox.profileNames = ["my-profile"];
    };
  };
}
