{pkgs}:
pkgs.writeShellScriptBin "update" ''
  pushd ~/.config/nix-config/

  sudo nix-channel --update
  sudo nix flake update

  popd
''
