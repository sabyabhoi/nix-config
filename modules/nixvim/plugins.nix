{
  inputs,
  pkgs,
  ...
}: {
  programs.nixvim = {
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
      gitsigns.enable = true;

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
      (pkgs.vimUtils.buildVimPlugin {
        name = "nui";
        src = pkgs.fetchFromGitHub {
          owner = "MunifTanjim";
          repo = "nui.nvim";
          rev = "b1b3dcd6ed8f355c78bad3d395ff645be5f8b6ae";
          hash = "sha256-JRVVRT1CZZTjr58L+gAer7eCg9/fMdAD0YD5ljNwl0Q=";
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
