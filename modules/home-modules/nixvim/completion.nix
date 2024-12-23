{pkgs, ...}: {
  programs.nixvim = {
    opts.completeopt = ["menu" "menuone" "noselect"];

    plugins = {
      luasnip = {
        enable = true;
        fromVscode = [
          {
            lazyLoad = true;
            paths = "${pkgs.vimPlugins.friendly-snippets}";
          }
          {
            paths = ./snippets;
          }
        ];
      };

      lsp = {
        enable = true;
        inlayHints = false;
        servers = {
          clangd.enable = true;
          gopls.enable = true;
          elixirls.enable = true;
          intelephense = {
            enable = true;
            package = pkgs.intelephense;
          };
          ocamllsp = {
            enable = true;
            package = null;
          };
          metals.enable = true; # for scala
          rust_analyzer = {
            enable = true;
            autostart = true;
            installCargo = false;
            installRustc = false;
            settings.cargo.features = "all";
          };
          gleam.enable = true;
          pyright.enable = true;
          pest_ls = {
            enable = true;
            autostart = true;
          };
          jsonls.enable = true;
          nixd.enable = true;
        };
        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
            "<leader>e" = "open_float";
          };

          lspBuf = {
            ga = "code_action";
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<leader>rn" = "rename";
          };
        };
      };

      lspkind = {
        # vscode-like pictograms
        enable = true;
        cmp = {
          enable = true;
          maxWidth = 50;
          ellipsisChar = "...";
        };
      };

      cmp = {
        enable = true;

        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

          window = {
            completion = {border = "single";};
            documentation = {border = "single";};
          };

          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = ''
              cmp.mapping(function(fallback)
                local has_words_before = function()
                  local cursor = vim.api.nvim_win_get_cursor(0)
                  return (vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], true)[1] or ""):sub(cursor[2], cursor[2]):match('%s')
                end
                if cmp.visible() and has_words_before() then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                elseif cmp.visible() then
                  cmp.select_next_item()
                elseif require('luasnip').expand_or_locally_jumpable() then
                  require('luasnip').expand_or_jump()
                else
                  fallback()
                end
              end, { 'i', 's' }),
            '';
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-p>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };

          sources = [
            {name = "codeium";}
            {name = "path";}
            {name = "nvim_lsp";}
            {name = "luasnip";}
            {
              name = "buffer";
              # Words from other open buffers can also be suggested.
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
          ];
        };
      };
    };
  };
}
