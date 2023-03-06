return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      local ts = require("nvim-treesitter.configs")
      ts.setup({
        auto_install = true,
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "help",
          -- Not core to neovim:
          "bash",
          "julia",
          "markdown",
          "markdown_inline",
          "python",
          "r",
        },
        highlight = {
          enable = true,
          disable = {}
        },
        --incremental_selection = {
        --  enable = true,
        --  keymaps = {
        --    init_selection = "<cr>",
        --    scope_incremental = "<cr>",
        --    node_incremental = "<tab>",
        --    node_decremental = "<S-tab>",
        --  },
        --},
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["if"] = {
                query = "@function.inner", desc = "inner function"
              },
              ["af"] = {
                query = "@function.outer", desc = "around function"
              },
              ["i,"] = {
                query = "@parameter.inner", desc = "inner parameter"
              },
              ["a,"] = {
                query = "@parameter.outer", desc = "around parameter"
              },
              ["a="] = {
                query = "@assignment.outer", desc = "around assignment"
              },
              ["i="] = {
                query = "@assignment.inner", desc = "inner assignment"
              },
              ["ac"] = {
                query = "@comment.outer", desc = "around comment"
              },
              ["ic"] = {
                query = "@comment.inner", desc = "inner comment"
              },
            }
          },
          move = {},
        }
      })
      vim.keymap.set("o", ",", "i,", {
        remap = true, desc = "Inner parameter"
      })
      vim.keymap.set("o", "=", "i=", {
        remap = true, desc = "Inner assignment"
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
  },
}
