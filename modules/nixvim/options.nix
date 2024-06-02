{
  programs.nixvim = {
    colorschemes.vscode.enable = true;

    clipboard.register = "unnamedplus";

    opts = {
      number = true;
      relativenumber = true;

      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;

      breakindent = true;
      smartindent = true;
      autoindent = true;
    };
  };
}
