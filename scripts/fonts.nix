{pkgs}:
pkgs.writeShellScriptBin "fonts" ''
  font=$(fc-list | awk -F":" '{print $2}' | sort | uniq | awk '{$1=$1};1' | ${pkgs.gum}/bin/gum filter | tr --delete "\n")
  ${pkgs.wl-clipboard}/bin/wl-copy $font

  ${pkgs.gum}/bin/gum style \
  	--border normal \
  	--margin "1" \
  	--padding "1" \
  	"$font copied to clipboard"
''
