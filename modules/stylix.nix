{
  inputs,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    cursor = {
      size = 12;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
  };
}
