{
  inputs,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "mouse";
        width = "(0, 300)";
        height = "(0, 500)";
        origin = "top-right";
        offset = "10x50";
        scale = 0;
        notification_limit = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 2;
        markup = "full";
        format = "%s\n%b";
        alignment = "center";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        icon_position = "left";
        min_icon_size = 0;
        max_icon_size = 32;
      };
    };
  };
}
