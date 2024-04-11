{
  inputs,
  pkgs,
  ...
}: {
  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
        ''${{
          printf "Directory Name: "
            read DIR
            mkdir $DIR
        }}
      '';
      mkfile = ''
        ''${{
          printf "File Name: "
            read FILE
            touch $FILE
        }}
      '';
    };
    keybindings = {
      n = "";
      nd = "mkdir";
      nf = "mkfile";
      "." = "set hidden!";
      "<enter>" = "open";
    };
    settings = {
      preview = true;
      drawbox = true;
      ignorecase = true;
      incsearch = true;
    };
  };
}
