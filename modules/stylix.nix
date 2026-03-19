{
  inputs,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;

    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    # base16Scheme = {
    #   base00 = "#000000"; # bg_main
    #   base01 = "#1e1e1e"; # bg_dim
    #   base02 = "#303030"; # bg_active (selection)
    #   base03 = "#989898"; # fg_dim (comments)
    #   base04 = "#bfc0c4"; # fg_inactive
    #   base05 = "#ffffff"; # fg_main
    #   base06 = "#c6daff"; # fg_alt
    #   base07 = "#f4f4f4"; # fg_active
    #   base08 = "#ff5f59"; # red
    #   base09 = "#db7b5f"; # rust (orange substitute)
    #   base0A = "#d0bc00"; # yellow
    #   base0B = "#44bc44"; # green
    #   base0C = "#00d3d0"; # cyan
    #   base0D = "#2fafff"; # blue
    #   base0E = "#feacd0"; # magenta
    #   base0F = "#9cbd6f"; # olive
    # };

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
