{
  inputs,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka NFM";
      size = 15.0;
    };
    shellIntegration.enableFishIntegration = true;
    theme = "VSCode_Dark";
    settings = {
      disable_ligatures = "never";
      confirm_os_window_close = 0;
    };
  };
}
