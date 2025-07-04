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
            map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset Hunk' })
            map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
            map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Reset Hunk' })
            map('n', '<leader>hS', gitsigns.stage_buffer)
            map('n', '<leader>hu', gitsigns.undo_stage_hunk)
            map('n', '<leader>hR', gitsigns.reset_buffer)
            map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview Hunk' })
            map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, { desc = 'Blame Hunk' })
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
        enable = false;
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
          "<leader>b" = "buffers";
          "<leader>d" = "lsp_document_symbols";
        };
        extensions = {
          ui-select.enable = true;
          fzf-native.enable = true;
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
      vim-slime = {
        enable = false;
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
      # codeium-nvim.enable = true;
      copilot-lua = {
        enable = true;
        settings = {
          # suggestion = {enabled = true;};
          panel = {enabled = false;};
        };
      };
      copilot-cmp.enable = true;
      nvim-ufo = {
        enable = true;
        settings.provider_selector = ''
          function(bufnr, filetype, buftype)
            return {'treesitter', 'indent'}
          end
        '';
      };
      emmet.enable = true;
      harpoon = {
        enable = true;
        enableTelescope = true;
      };
    };
    # extraPlugins = [pkgs.vimPlugins.jellybeans-nvim];
    extraConfigLua = ''
      -- vim.cmd.colorscheme 'jellybeans-nvim'
      local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }

      local mapped_signs = {}
      for type_str, icon in pairs(signs) do
        -- Assuming vim.diagnostic.severity is available (which it is)
        local severity_constant = vim.diagnostic.severity[string.upper(type_str)]
        if severity_constant then
          mapped_signs[severity_constant] = icon
        end
      end

      vim.diagnostic.config({
        signs = {
          text = mapped_signs,
          -- You can also set texthl and numhl here if you want them to be specific to the sign,
          -- though usually you'd link them to the general DiagnosticSign* highlights.
          -- For example, to explicitly link texthl and numhl for each sign type to its
          -- corresponding highlight group (which is often the default behavior anyway):
          numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
          },
          texthl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
          },
        },
      })
    '';
  };
}
