{
  inputs,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        reload_style_on_change = 1;
        position = "top";

        height = 35;

        margin-left = 0;
        margin-bottom = 0;
        margin-right = 0;

        spacing = 5;

        modules-left = ["sway/workspaces"];
        modules-center = [];
        modules-right = ["network" "battery"];

        network = {
          format-wifi = " {essid}";
          format-ethernet = " {ifname}";
          format-linked = "{ifname} (No IP) ";
          format = "";
          format-muted = " ";
          format-disconnected = "  Disconnected";
          format-alt = "{ifname}= {ipaddr}/{cidr}";
          on-click = "sleep 0.1 && bash ~/.config/rofi/rofi-wifi-menu.sh";
          on-click-right = "wl-copy $(ip address show up scope global | grep inet6 | head -n1 | cut -d/ -f 1 | tr -d [=space=] | cut -c6-)";
          tooltip-format = " {bandwidthUpBits}  {bandwidthDownBits}\n{ifname}\n{ipaddr}/{cidr}\n";
          tooltip-format-wifi = " {essid} {frequency}MHz\nStrength= {signaldBm}dBm ({signalStrength}%)\nIP= {ipaddr}/{cidr}\n {bandwidthUpBits}  {bandwidthDownBits}";
          interval = 10;
        };

        battery = {
          interval = 2;
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
      };
    };
  };
}
