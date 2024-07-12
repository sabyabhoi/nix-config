{
  inputs,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;
        iconsEnabled = true;
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
      };
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
      gitsigns.enable = true;
      competitest = {
        enable = true;
        settings = {
          maximum_time = 2000;
          testcases_directory = "./testcases";
        };
      };

      treesitter = {
        enable = true;
        ensureInstalled = ["c" "cpp" "python" "go" "rust" "nix" "kdl" "json"];
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>sg" = "live_grep";
          "<leader>sf" = "find_files";
        };
      };

      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          close_on_exit = true;
          size = 20;
          hide_numbers = true;
          open_mapping = "[[<C-\\>]]";
          start_in_insert = true;
          shading_factor = 2;
          float_opts = {
            border = "curved";
            winblend = 0;
            highlights = {
              border = "Normal";
              background = "Normal";
            };
          };
        };
      };
    };
    extraPlugins = [pkgs.vimPlugins.jellybeans-nvim];
    extraConfigLua = "vim.cmd.colorscheme 'jellybeans-nvim'";
  };
}
