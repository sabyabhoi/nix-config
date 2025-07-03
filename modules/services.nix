{
  inputs,
  pkgs,
  ...
}: {
  services = {
    emacs = {
      enable = true;
      package = with pkgs; (
        (emacsPackagesFor emacsNativeComp).emacsWithPackages (
          epkgs: [epkgs.vterm]
        )
      );
    };
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

        START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
      };
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
      };
    };
    # displayManager = {
    #   defaultSession = "hyprland";
    #   autoLogin = {
    #     enable = true;
    #     user = "cognusboi";
    #   };
    # };
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
    syncthing.enable = true;
  };
}
