{
  inputs,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 15.0;
    };
    shellIntegration.enableFishIntegration = true;
    themeFile = "Catppuccin-Mocha";
    settings = {
      disable_ligatures = "never";
      confirm_os_window_close = 0;
    };
  };
}
