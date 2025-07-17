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

    homeManagerIntegration.autoImport = true;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      serif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 12;
        popups = 12;
      };
    };
  };
}
