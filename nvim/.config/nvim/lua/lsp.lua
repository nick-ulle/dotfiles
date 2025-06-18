vim.lsp.config("pylsp", {
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
})

vim.lsp.config("r_language_server", {
  settings = {
    r = {
      lsp = {
        diagnostics = false
      }
    }
  }
})
