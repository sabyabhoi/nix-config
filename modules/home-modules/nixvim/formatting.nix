{ pkgs, ... }:
let
  jsLikeFormatter = {
    __unkeyed-1 = "prettierd";
    __unkeyed-2 = "prettier";
    timeout_ms = 2000;
    stop_after_first = true;
  };
in {
  programs.nixvim = {
    plugins.none-ls = {
      enable = false;
      enableLspFormat = false;
      sources.formatting.prettierd = {
        enable = false;
        disableTsServerFormatter = false;
      };
    };

    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          bash = [ "shellcheck" "shellharden" "shfmt" ];
          cpp = [ "clang_format" ];

          # Grouping JS-like languages
          javascript = jsLikeFormatter;
          javascriptreact = jsLikeFormatter;
          typescript = jsLikeFormatter;
          typescriptreact = jsLikeFormatter;

          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
        };

        log_level = "warn";
        notify_on_error = false;
        notify_no_formatters = false;
      };

      luaConfig.post = ''
        vim.keymap.set("n", "<Leader>f", function()
          require('conform').format({
            async = false,
            lsp_fallback = true,
            timeout_ms = 2000,
          })
        end, { desc = "Format" })
      '';
    };
  };
}
