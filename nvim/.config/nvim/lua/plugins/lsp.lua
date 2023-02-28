local config_lspconfig = function()
  local lsp = require("lspconfig")

  -- Lua
  lsp.lua_ls.setup {
    settings = {
      Lua = {
        diagnostics = {
          -- Make the LS recognize the `vim` global.
          globals = { "vim" }
        },
        workspace = {
          -- Make the LS aware of the Neovim API.
          library = vim.api.nvim_get_runtime_file("", true)
        }
      }
    }
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
  lsp.pylsp.setup {}
end

return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"williamboman/mason.nvim"},
    opts = {
      ensure_installed = {"lua_ls"},
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason-lspconfig.nvim"},
    config = config_lspconfig
  },
}
