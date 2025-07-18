{
  config,
  inputs,
  lib,
  ...
}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = let
      normal =
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        }) {
          "<Space>" = "<NOP>";
          "<esc>" = ":noh<CR>";
          "<C-h>" = "<C-w>h";
          "<C-l>" = "<C-w>l";

          "H" = ":BufferLineCyclePrev<CR>";
          "L" = ":BufferLineCycleNext<CR>";

          "<Leader>n" = ":NvimTreeFindFileToggle<CR>";
          "<Leader>." = ":NvimTreeFindFileToggle<CR>";
          "<Leader>/" = ":lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<CR>";
          "<Leader>sf" = ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })<CR>";
        };
      visual =
        lib.mapAttrsToList
        (key: action: {
          mode = "v";
          inherit action key;
        }) {
          "<Space>" = "<NOP>";

          "<" = "<gv";
          ">" = ">gv";
        };
    in
      config.lib.nixvim.keymaps.mkKeymaps
      {options.silent = true;}
      (normal
        ++ visual
        ++ [
          {
            action.__raw = "vim.lsp.buf.format";
            key = "<Leader>f";
            mode = "n";
            options = {
              silent = true;
            };
          }
        ]);
  };
}
