{pkgs}:
pkgs.writeShellScriptBin "m720" ''
  video=$(${pkgs.rofi}/bin/rofi -dmenu)
  ${pkgs.mpv}/bin/mpv --ytdl-format="best[height<=1000]" "$video"
''
