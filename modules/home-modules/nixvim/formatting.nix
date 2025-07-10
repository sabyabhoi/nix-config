{pkgs, ...}: {
  programs.nixvim = {
    plugins.none-ls = {
      enable = false;
      enableLspFormat = true;

      sources.formatting = {
        prettierd = {
          enable = false;
          disableTsServerFormatter = false;
        };
      };
    };
  };
}
