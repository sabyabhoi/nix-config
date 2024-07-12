{
  inputs,
  pkgs,
  ...
}: {
  systemd = {
    timers."wallpaper-change" = {
      wantedBy = ["timers.target"];
      timerConfig = {
        OnBootSec = "5";
        OnUnitActiveSec = "30m";
        Unit = "wallpaper-change.service";
      };
    };
    services."wallpaper-change" = {
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
  };
}
