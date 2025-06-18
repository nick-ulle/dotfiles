local config_lspconfig = function()
  local lsp = require("lspconfig")

  -- Lua
  lsp.lua_ls.setup {}

  -- R
  lsp.r_language_server.setup {
    settings = {
      r = {
        lsp = {
          diagnostics = false
        }
      }
    }
  }

  -- Python
  lsp.pylsp.setup {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {
              "E203", -- whitespace before `:` (and also `,`?)
              "E251", -- spaces around parameter equals
              "W503", -- line break before binary operator
            }
          }
        }
      }
    }
  }

  -- Julia
  lsp.julials.setup {}

  -- Bash
  lsp.bashls.setup {}

  -- JSON
  lsp.jsonls.setup {}
end

return {
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    opts = {
      lspFeatures = {
        enabled = false,
        languages = { "r", "python", "julia" },
        diagnostics = {
          enabled = true,
          triggers = { "BufWrite" }
        },
        completion = {
          enabled = true
        }
      }
    }
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "bashls",
        "jsonls",
        "julials",
        "pylsp",
        "r_language_server",
      },
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
    },
    config = config_lspconfig
  },
}
