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
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
      };
    };
    n8n.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        options = "caps:swapescape";
      };
    };
    auto-cpufreq.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
    openssh.enable = true;
    blueman.enable = true;
    syncthing.enable = true;
  };
}
