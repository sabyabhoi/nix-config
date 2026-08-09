{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    # configType = "hyprlang";

    settings = {
      monitor = [
        "DP-2,2560x1440@144,0x0,1"
        "HDMI-A-1,1920x1080@60,2560x0,1"
        ",preferred,auto,auto"
      ];

      render = {
        cm_auto_hdr = 0;
        direct_scanout = 2;
      };

      "$terminal" = "ghostty";
      "$mainMod" = "SUPER";

      exec-once = [
        "waybar"
        "awww-daemon --format xrgb"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 15;
        border_size = 1;
        resize_on_border = true;
        allow_tearing = false;
        layout = "scrolling";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur = {
          enabled = false;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "fast, 0.05, 0.0, 0.05, 1.0";
        animation = [
          "windows, 1, 1, fast, slide"
          "windowsIn, 1, 1, fast, slide"
          "windowsOut, 1, 1, fast, slide"
          "workspaces, 1, 2, fast, slide"
          "fade, 1, 1, fast"
          "fadeIn, 1, 1, fast"
          "fadeOut, 1, 1, fast"
        ];
      };

      dwindle = {
        preserve_split = true;
      };

      scrolling = {
        fullscreen_on_one_column = true;
        column_width = 0.9;
        direction = "right";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "us,us";
        kb_variant = ",colemak";
        kb_model = "";
        kb_options = "caps:escape,ctrl:swap_lalt_lctl,grp:alt_space_toggle";
        kb_rules = "";
        repeat_delay = 200;
        repeat_rate = 25;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      bind = [
        "SUPER_SHIFT, space, exec, hyprctl switchxkblayout sino-wealth-gaming-kb--keyboard next"
        "$mainMod, Return, exec, $terminal"
        "SUPER_SHIFT, Q, killactive,"
        "$mainMod, f, fullscreen,"
        "SUPER_SHIFT, E, exit,"
        "$mainMod, z, exec, handy --toggle-transcription"
        "$mainMod, E, exec, emacsclient -c"
        "$mainMod, t, togglefloating,"
        "$mainMod, space, exec, vicinae open"
        "$mainMod, p, pseudo,"
        "$mainMod, period, layoutmsg, move +col"
        "$mainMod, comma, layoutmsg, move -col"
        "$mainMod SHIFT, period, layoutmsg, swapcol r"
        "$mainMod SHIFT, comma, layoutmsg, swapcol l"
        "$mainMod, mouse_up, layoutmsg, focus r"
        "$mainMod, mouse_down, layoutmsg, focus l"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod SHIFT, x, exec, systemctl suspend"
        "CTRL, space, exec, dunstctl close"
        "$mainMod CTRL, l, movecurrentworkspacetomonitor, r"
        "$mainMod CTRL, h, movecurrentworkspacetomonitor, l"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 10%+"
        ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 10%-"
        "$mainMod, Print, exec, hyprshot -m region"
        ", Print, exec, hyprshot -m active -m window"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ", XF86MonBrightnessUp, exec, brightnessctl s +10%"
      ];

      windowrule = [
        {
          name = "windowrule-1";
          suppress_event = "maximize";
          "match:class" = ".*";
        }
        {
          name = "windowrule-2";
          no_initial_focus = "on";
          no_focus = "on";
          no_follow_mouse = "on";
          "match:class" = "jetbrains-idea-ce";
          "match:title" = "^win(.*)";
        }
      ];
    };
  };

  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 120;
            on-timeout = "brightnessctl -s set 10%";
            on-resume = "brightnessctl -r";
          }
          {
            timeout = 300;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
    hyprpaper.enable = false;
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = false;
      };

      animations = {
        enabled = true;
        bezier = "linear, 1, 1, 0, 0";
        animation = [
          "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 2, linear"
        ];
      };

      background = {
        monitor = "";
        # path = "screenshot";
        blur_passes = 3;
      };

      "input-field" = {
        monitor = "";
        size = "20%, 5%";
        outline_thickness = 3;
        fade_on_empty = false;
        rounding = 15;
        font_family = "Monospace";
        placeholder_text = "Input password...";
        fail_text = "$PAMFAIL";
        dots_spacing = 0.3;
        position = "0, -20";
        halign = "center";
        valign = "center";
      };

      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = 90;
          font_family = "Monospace";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:60000] date +''%A, %d %B %Y''";
          font_size = 25;
          font_family = "Monospace";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];
    };
  };
}
