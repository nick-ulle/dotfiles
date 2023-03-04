return {
  -- Interface
  {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    name = "gitsigns",
    opts = {},
  },
  {
    "NvChad/nvim-colorizer.lua",
    name = "colorizer",
    opts = {
      filetypes = { "*", "!mason" },
    },
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeoutlen = 800
      require("which-key").setup {
        layout = {
          height = { min = 2, max = 10 }
        },
        popup_mappings = {
          scroll_down = "<down>",
          scroll_up = "<up>",
        }
      }
    end
  },

  -- Behaviors
  {
    "numToStr/Comment.nvim",
    name = "Comment",
    lazy = false,
    opts = {},
    config = function(plugin, opts)
      require(plugin.name).setup(opts)
      vim.keymap.set("n", "<leader>c", "gcc", { remap = true })
      vim.keymap.set("v", "<leader>c", "gc", { remap = true })
    end
  },
  {
    "kylechui/nvim-surround",
    tag = "v1.0.0",
    lazy = false,
    opts = {},
  },

  "ntpeters/vim-better-whitespace",
  -- Vimscript plugins
  {
    "junegunn/vim-easy-align",
    config = function()
      vim.keymap.set({"n", "x"}, "ga", "<Plug>(EasyAlign)")
    end
  },
  --"mfussenegger/nvim-dap"
}
