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
              ["if"] = "@function.inner",
              ["af"] = "@function.outer",
              [","] = "@parameter.inner",
              ["a,"] = "@parameter.outer",
            }
          },
          move = {},
        }
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
  },
}
