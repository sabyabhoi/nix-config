{pkgs, ...}: {
  programs.nixvim = {
    plugins.none-ls = {
      enable = true;
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
