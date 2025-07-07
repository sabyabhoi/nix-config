{
  inputs,
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    # settings = {
    #   default_layout = "compact";
    #   pane_frames = false;
    # };
  };
}
