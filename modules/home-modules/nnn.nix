{
  inputs,
  pkgs,
  ...
}: {
  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override {withNerdIcons = true;};
    extraPackages = with pkgs; [
      tabbed
      ffmpegthumbnailer
      mediainfo
      sxiv
      mpv
      zathura
    ];
    plugins.src =
      (pkgs.fetchFromGitHub {
        owner = "jarun";
        repo = "nnn";
        rev = "v4.4";
        sha256 = "15w7jjhzyj1fq1c8f956pj7s729w8h3dih2ghxiann68rw4rmlc3";
      })
      + "/plugins";
    plugins.mappings = {
      j = "autojump";
    };
  };
}
