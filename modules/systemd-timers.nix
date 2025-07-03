{pkgs, ...}: {
  systemd = {
    services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal"; # Without this errors will spam on screen
      # Without these bootlogs will spam on screen
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
    timers = {
      "wallpaper-change" = {
        wantedBy = ["timers.target"];
        timerConfig = {
          OnBootSec = "5";
          OnUnitActiveSec = "30m";
          Unit = "wallpaper-change.service";
        };
      };
      "hydrate" = {
        wantedBy = ["timers.target"];
        timerConfig = {
          OnUnitActiveSec = "20m";
          Unit = "hydrate.service";
        };
      };
    };
    services = {
      "wallpaper-change" = {
        serviceConfig = {
          Type = "oneshot";
          User = "cognusboi";
        };
        path = [
          # pkgs.swww
        ];
        script = let
          python = pkgs.python3.withPackages (ps: with ps; [pillow]);
        in ''
          cd /home/cognusboi/programming/python/wallquote/
          ${python}/bin/python app.py
        '';
      };
      "hydrate" = {
        serviceConfig = {
          Type = "oneshot";
          User = "cognusboi";
          Environment = "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus";
        };
        path = [];
        script = ''
          ${pkgs.libnotify}/bin/notify-send "Drink some water"
        '';
      };
    };
  };
}
