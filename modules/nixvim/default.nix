{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix
    ./plugins.nix
    ./keymaps.nix
    ./completion.nix
  ];
  programs.nixvim = {
    enable = true;
    enableMan = true;
    defaultEditor = true;
  };
}
