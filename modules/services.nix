{
  inputs,
  pkgs,
  ...
}: {
  services = {
    displayManager = {
      defaultSession = "sway";
      autoLogin = {
        enable = true;
        user = "cognusboi";
      };
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        options = "caps:swapescape";
      };
    };
    auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
        };

        battery = {
          governor = "conservative";
          # governor = "powersave";
          energy_performance_preference = "power";
          epp = "power";
          energy-performance-preference = "power";
          turbo = "never";
        };
      };
    };
    gvfs.enable = true;
    udisks2.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
    blueman.enable = true;
  };
}
