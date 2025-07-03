{
  programs.nixvim = {
    clipboard.register = "unnamedplus";
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

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

      colorcolumn = "80";

      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
    };

    diagnostic.settings = {
      virtual_text = false;
      update_in_insert = true;
      signs = true;
      float = {
        focusable = false;
        style = "minimal";
        border = "rounded";
        source = "always";
        # header = "";
        # prefix = "";
      };
    };
  };
}
