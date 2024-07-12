{pkgs}:
pkgs.writeShellScriptBin "m1080" ''
  video=$(${pkgs.rofi}/bin/rofi -dmenu)
  ${pkgs.mpv}/bin/mpv --ytdl-format="best[height<=1080]" "$video"
''
