{
  inputs,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;
        settings.options = {
          icons_enabled = true;
          component_separators = {
            left = "|";
            right = "|";
          };
          section_separators = {
            left = "";
            right = "";
          };
        };
      };
      nvim-autopairs.enable = true;
      web-devicons.enable = true;

      bufferline = {
        enable = true;
        settings.options.separator_style = "slant";
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
      gitsigns = {
        enable = true;
        settings.on_attach = ''
          function(bufnr)
            local gitsigns = require('gitsigns')

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
              if vim.wo.diff then
                vim.cmd.normal({']c', bang = true})
              else
                gitsigns.nav_hunk('next')
              end
            end)

            map('n', '[c', function()
              if vim.wo.diff then
                vim.cmd.normal({'[c', bang = true})
              else
                gitsigns.nav_hunk('prev')
              end
            end)

            -- Actions
            map('n', '<leader>hs', gitsigns.stage_hunk)
            map('n', '<leader>hr', gitsigns.reset_hunk)
            map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
            map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
            map('n', '<leader>hS', gitsigns.stage_buffer)
            map('n', '<leader>hu', gitsigns.undo_stage_hunk)
            map('n', '<leader>hR', gitsigns.reset_buffer)
            map('n', '<leader>hp', gitsigns.preview_hunk)
            map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
            map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
            map('n', '<leader>hd', gitsigns.diffthis)
            map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
            map('n', '<leader>td', gitsigns.toggle_deleted)

            -- Text object
            map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
          end
        '';
      };
      competitest = {
        enable = true;
        settings = {
          maximum_time = 2000;
          testcases_directory = "./testcases";
        };
      };

      treesitter = {
        enable = true;
        settings = {
          ensure_installed = ["c" "cpp" "python" "go" "rust" "nix" "kdl" "json" "gleam"];
          highlight.enable = true;
        };
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>sg" = "live_grep";
          "<leader>sf" = "find_files";
        };
        extensions.ui-select.enable = true;
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
      vim-slime = {
        enable = true;
        settings = {
          target = "zellij";
          default_config = {
            session_id = "current";
            relative_pane = "right";
          };
        };
      };
      which-key.enable = true;
      render-markdown.enable = true;
    };
    extraPlugins = [pkgs.vimPlugins.jellybeans-nvim];
    extraConfigLua = ''
      -- vim.cmd.colorscheme 'jellybeans-nvim'
      local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    '';
  };
}
