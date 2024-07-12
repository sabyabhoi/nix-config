{
  inputs,
  pkgs,
  ...
}: {
  xdg = {
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };
    mime.defaultApplications = {
      "application/pdf" = "org.pwmt.zathura.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
      "application/vnd.oasis.opendocument.text" = "writer.desktop";
      "image/jpeg" = "imv.desktop";
      "image/png" = "imv.desktop";
      "image/svg+xml" = "imv.desktop";
      "text/html" = "brave-browser.desktop";
      "application/json" = "nvim.desktop";
    };
  };
}
