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

      laststatus = 3;
    };

    autoCmd = [
      {
        event = "FileType";
        pattern = "rust";
        desc = "Rust uses 100-char line guide (rustfmt default)";
        callback.__raw = ''
          function()
            vim.opt_local.colorcolumn = "100"
          end
        '';
      }
    ];

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
