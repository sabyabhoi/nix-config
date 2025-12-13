{pkgs}:
pkgs.writeShellScriptBin "clean" ''
  nix-collect-garbage --delete-older-than 7d  # keeps last 7 days
  nix-store --gc
  nix-store --optimise
  nix-env --delete-generations old
''
