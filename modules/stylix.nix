{
  inputs,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    image = ./home-modules/0002-doom.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    cursor = {
      size = 12;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
  };
}
