{ pkgs, lib, ... }:
{
  programs.nixvim = {
    enable = true;

    plugins.web-devicons.enable = true;

    # Basic options
    opts = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      clipboard = "unnamedplus";
      mouse = "a";
      termguicolors = true;
    };

    # Keybindings (can be customized)
    keymaps = [
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        options = { noremap = true; silent = true; };
      }
    ];

    # Plugins
    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      treesitter = {
        enable = true;
        settings = {
          ensure_installed = [ "nix" "lua" "python" "typescript" "json" "bash" "qmljs" ];
        };
      };
      which-key.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;
        # sources = [
        #   { name = "nvim_lsp"; }
        #   { name = "buffer"; }
        #   { name = "path"; }
        # ];
        # mappingPresets = [ "insert" ];
      };

      lsp = {
        enable = true;
        servers = {
          lua_ls.enable = true;
          ts_ls.enable = true;
          pyright.enable = true;
          nil_ls.enable = true;
          qmlls.enable = true;
        };
      };
    };

    extraConfigLua = ''
      vim.g.mapleader = " "
    '';
  };
}
