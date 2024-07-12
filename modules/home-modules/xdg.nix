{
  inputs,
  pkgs,
  ...
}: {
  xdg.desktopEntries = {
    m720 = {
      name = "m720";
      terminal = false;
      exec = "/home/cognusboi/.nix-profile/bin/m720";
    };
    m1080 = {
      name = "m1080";
      terminal = false;
      exec = "/home/cognusboi/.nix-profile/bin/m1080";
    };
  };
}
