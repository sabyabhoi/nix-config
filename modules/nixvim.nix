{
  inputs,
  pkgs,
  ...
}: {
  programs.nixvim = {
    enable = true;
    enableMan = true;
    defaultEditor = true;

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

    globals.mapleader = " ";
    globals.maplocalleader = " ";

    plugins = {
      lualine.enable = true;
      nvim-autopairs.enable = true;

      bufferline = {
        enable = true;
        separatorStyle = "slant";
      };

      comment = {
        enable = true;
        settings = {
          padding = true;
          sticky = true;
          toggler = {
            line = "<C-m>";
            block = "gbc";
          };
          opleader = {
            line = "<C-m>";
            block = "gb";
          };
          extra = {
            above = "gcO";
            below = "gco";
            eol = "gcA";
          };
        };
      };

      indent-blankline = {
        enable = true;
        settings = {
          indent.char = "┊";
        };
      };

      nvim-tree.enable = true;

      luasnip.enable = true;

      treesitter = {
        enable = true;
        ensureInstalled = ["c" "cpp" "python" "go" "rust"];
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>sg" = "live_grep";
          "<leader>sf" = "find_files";
        };
      };

      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;
          ruff-lsp.enable = true;
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        # sources = [
        #   {name = "nvim_lsp";}
        #   {name = "path";}
        #   {name = "buffer";}
        # ];

        mapping = {
          "<CR>" = "cmp.mapping.confirm({select = true})";
          # "<Tab>" = {
          #   action = ''
          #     function(fallback)
          #       if cmp.visible() then
          #         cmp.select_next_item()
          #       elseif luasnip.expandable() then
          #         luasnip.expand()
          #       elseif luasnip.expand_or_jumpable() then
          #         luasnip.expand_or_jump()
          #       else
          #         fallback()
          #       end
          #     end
          #   '';
          #   modes = ["i" "s"];
          # };
        };
      };
    };

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "competitest";
        src = pkgs.fetchFromGitHub {
          owner = "xeluxee";
          repo = "competitest.nvim";
          rev = "c3cb0e2b0916a879c4d3dcb5737e6c046dd0afc5";
          hash = "sha256-ABxdZ98W5W6K0rz0z/1I5lXzLCBnth6ozUUQ1W1nvpo=";
        };
      })
    ];

    extraConfigLua = ''
      require('competitest').setup({
        testcases_directory = "./testcases",
        maximum_time = 2000,
      })
    '';
  };
}
