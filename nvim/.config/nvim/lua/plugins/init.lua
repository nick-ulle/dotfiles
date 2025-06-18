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
      vim.keymap.set("n", "<leader>t", "gcc", {
        remap = true, desc = "Toggle line comment"
      })
      vim.keymap.set("v", "<leader>t", "gc", {
        remap = true, desc = "Toggle line comment"
      })
    end
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  -- Vimscript plugins
  "ntpeters/vim-better-whitespace",
  {
    "junegunn/vim-easy-align",
    config = function()
      vim.keymap.set({"n", "x"}, "ga", "<Plug>(EasyAlign)", {
        desc = "Activate EasyAlign"
      })
    end
  },
  --"mfussenegger/nvim-dap"
}
