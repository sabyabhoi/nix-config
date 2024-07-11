{
  inputs,
  pkgs,
  ...
}: {
  services.picom = {
    enable = false;
    shadow = true;
    fade = true;
    fadeDelta = 3;
    activeOpacity = 0.95;
    inactiveOpacity = 0.93;
    opacityRules = [
      "100:class_g = 'Brave-browser'"
      "100:class_g = 'Zathura'"
      "100:class_g = 'discord'"
      "100:class_g = 'anytype'"
      "100:class_g = 'Android Emulator - Pixel_XL_API_30:5554'"
      "100:class_g = 'Emulator'"
      "100:class_g = 'Gimp'"
      "100:class_g = 'AFFiNE'"
      "100:class_g = 'notion-app'"
      "100:class_g = 'albert'"
      "100:class_g = 'firefox'"
      "100:class_g = 'i3lock'"
      "100:class_g = 'mpv'"
      "100:class_g = 'kmines'"
      "100:class_g = 'zoom'"
      "100:class_g = 'imv'"
      "100:class_g = 'sioyek'"
    ];
    backend = "glx";
    settings = {
      blur = {
        method = "dual_kawase";
        strength = 7;
      };
    };
  };
}
