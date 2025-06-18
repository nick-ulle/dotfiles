local config_lspconfig = function()
  local lsp = require("lspconfig")

  -- Lua
  lsp.lua_ls.setup {
    before_init = require("neodev.lsp").before_init,
    settings = {
      Lua = {
      }
    },
  }

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
    "folke/neodev.nvim",
    name = "neodev",
    opts = {
      setup_jsonls = true,
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
      { "folke/neodev.nvim", name = "neodev", lazy = false },
    },
    config = config_lspconfig
  },
}
