{
  inputs,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins = {
      avante = {
        enable = true;
        settings = {
          provider = "openrouter";
          providers = {
            openrouter = {
              __inherited_from = "openai";
              endpoint = "https://openrouter.ai/api/v1";
              api_key_name = "OPENROUTER_API_KEY";
              model = "qwen/qwen3-coder";
            };
          };
        };
      };
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
      render-markdown = {
        enable = true;
        settings.file_types = ["markdown" "Avante" "md"];
      };
      dressing.enable = true;
      nui.enable = true;
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
      zellij-nav = {
        enable = true;
        luaConfig.post = ''
          local map = vim.keymap.set
          map("n", "<M-h>", "<cmd>ZellijNavigateLeftTab<cr>",
              { desc = "navigate to left or tab" })
          map("n", "<M-j>", "<cmd>ZellijNavigateDown<cr>",
              { desc = "navigate down" })
          map("n", "<M-k>", "<cmd>ZellijNavigateUp<cr>",
              { desc = "navigate to up" })
          map("n", "<M-l>", "<cmd>ZellijNavigateRightTab<cr>",
              { desc = "navigate to right or tab" })
        '';
      };
      harpoon = {
        enable = true;
        settings.global_settings = {
          save_on_toggle = false;
          save_on_change = true;
          enter_on_sendcmd = false;
          excluded_filetypes = ["harpoon"];
          mark_branch = false;
        };
        luaConfig.post = ''
          local harpoon = require('harpoon')
          harpoon:setup({})

          -- basic telescope configuration
          local conf = require("telescope.config").values
          local function toggle_telescope(harpoon_files)
              local file_paths = {}
              for _, item in ipairs(harpoon_files.items) do
                  table.insert(file_paths, item.value)
              end

              require("telescope.pickers").new({}, {
                  prompt_title = "Harpoon",
                  finder = require("telescope.finders").new_table({
                      results = file_paths,
                  }),
                  previewer = conf.file_previewer({}),
                  sorter = conf.generic_sorter({}),
              }):find()
          end

          vim.keymap.set("n", "<Leader>ha", function() harpoon:list():add() end,
              { desc = "Add window to harpoon window" })
          vim.keymap.set("n", "<Leader>he", function() toggle_telescope(harpoon:list()) end,
              { desc = "Open harpoon window" })
        '';
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
