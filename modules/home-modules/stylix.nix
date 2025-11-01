{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;

    targets = {
      neovim.enable = false;
      nixvim.enable = false;
      waybar = {
        enable = false;
      };
      firefox.profileNames = ["my-profile"];
    };
  };
}
