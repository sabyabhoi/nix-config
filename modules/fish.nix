{ inputs, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      set fish_greeting
      fish_vi_key_bindings
      set userfiles /home/cognusboi/workspace
    '';
    shellAliases = {
      vim = "nvim";
      dots = "cd $userfiles/dotfiles";
    };
  };
}
