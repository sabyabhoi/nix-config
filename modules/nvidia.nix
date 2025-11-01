{
  config,
  inputs,
  pkgs,
  ...
}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
      vaapiIntel
      vdpauinfo
      libva-utils
    ];
  };

  # Intel integrated graphics
  services.xserver.videoDrivers = ["modesetting"];
}
