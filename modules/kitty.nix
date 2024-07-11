{
  inputs,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "MonaspiceAr NFM";
      size = 15.0;
    };
    shellIntegration.enableFishIntegration = true;
    theme = "Jellybeans";
    settings = {
      disable_ligatures = "never";
      confirm_os_window_close = 0;
    };
  };
}
