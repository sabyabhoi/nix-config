{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [ghostty];

  xdg.configFile."ghostty/config".text = ''
    # Font
    font-size = 15

    bold-is-bright = false
    adjust-box-thickness = 1

    # Theme
    background-opacity = 1.0

    cursor-style = bar
    cursor-style-blink = true
    adjust-cursor-thickness = 1

    resize-overlay = never
    copy-on-select = false
    confirm-close-surface = false
    mouse-hide-while-typing = true

    window-theme = ghostty
    window-padding-balance = true
    window-padding-color = background
    window-inherit-working-directory = true
    window-inherit-font-size = true
    window-decoration = false

    gtk-titlebar = false
    gtk-single-instance = true
    gtk-tabs-location = bottom
    gtk-wide-tabs = false

    auto-update = off
  '';
}
