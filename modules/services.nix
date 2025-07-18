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
    tlp.enable = false;
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
    auto-cpufreq.enable = false;
    # gamemode.enable = true;
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
