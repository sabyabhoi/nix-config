{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;

    targets = {
      neovim.enable = false;
      nixvim.enable = false;
      waybar = {
        enable = false;
      };
    };
  };
}
