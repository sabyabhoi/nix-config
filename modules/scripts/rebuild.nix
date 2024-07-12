{pkgs}:
pkgs.writeShellScriptBin "rebuild" ''
  pushd ~/.config/nix-config/

  ${pkgs.alejandra}/bin/alejandra . &>/dev/null \
    || (${pkgs.alejandra}/bin/alejandra . ; echo "formatting failed!" && exit 1)

  sudo nixos-rebuild switch --flake ~/.config/nix-config

  popd
''
