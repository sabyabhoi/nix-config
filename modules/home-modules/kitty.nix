{
  inputs,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      disable_ligatures = "never";
      confirm_os_window_close = 0;
    };
  };
}
