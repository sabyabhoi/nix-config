{
  inputs,
  pkgs,
  ...
}: {
  services = {
    emacs = {
      enable = false;
      package = with pkgs; (
        (emacsPackagesFor emacs).emacsWithPackages (
          epkgs: [epkgs.vterm]
        )
      );
    };
    tlp.enable = false;
    fstrim.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd start-hyprland";
          user = "greeter";
        };
      };
    };
    n8n.enable = false;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        options = "caps:swapescape";
      };
    };
    auto-cpufreq.enable = false;
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
    syncthing.enable = false;
  };
}
