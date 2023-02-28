return {
  -- Aesthetics
  {
    "RRethy/nvim-base16",
    lazy = false,
    priority = 100,
    config = function()
      vim.cmd("colorscheme base16-solarized-light")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function()
      require("lualine").setup {}
    end
  },

  -- Other plugins
  "tpope/vim-surround",
  "PeterRincker/vim-argumentative",
  "ntpeters/vim-better-whitespace",
  {
    "junegunn/vim-easy-align",
    config = function()
      vim.keymap.set({"n", "x"}, "ga", "<Plug>(EasyAlign)")
    end
  },
  --"mfussenegger/nvim-dap"
}

