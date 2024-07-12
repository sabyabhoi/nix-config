{
  programs.nixvim = {

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

      smartcase = true;
      ignorecase = true;
    };
  };
}
