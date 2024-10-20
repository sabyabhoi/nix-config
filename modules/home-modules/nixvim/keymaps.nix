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

          "<Leader>cr" = ":CompetiTest run<CR>";
          "<Leader>ce" = ":CompetiTest edit_testcase<CR>";
          "<Leader>ca" = ":CompetiTest add_testcase<CR>";
          "<Leader>cd" = ":CompetiTest delete_testcase<CR>";

          "<Leader>n" = ":NvimTreeToggle<CR>";
          "<Leader>." = ":NvimTreeToggle<CR>";
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
