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

    diagnostics = {
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
