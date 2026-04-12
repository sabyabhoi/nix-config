{
  inputs,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      confirm-close-surface = false;
    };
  };
}
