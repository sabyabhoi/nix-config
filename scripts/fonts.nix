{pkgs}: 
pkgs.writeShellScriptBin "fonts" ''
fc-list | awk -F":" '{print $2}' | sort | uniq | awk '{$1=$1};1' | ${pkgs.gum}/bin/gum filter | tr --delete "\n" | ${pkgs.xclip}/bin/xclip -selection clipboard

${pkgs.gum}/bin/gum style \
	--border normal \
	--margin "1" \
	--padding "1" \
	"$(${pkgs.xclip}/bin/xclip -o -sel clipboard) copied to clipboard"
''
