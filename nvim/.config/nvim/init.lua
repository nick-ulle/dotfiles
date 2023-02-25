
require('packer').startup(function(use)
  -- Package managers
  use "wbthomason/packer.nvim"

  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use "mfussenegger/nvim-dap"

  -- Tmux
  use "christoomey/vim-tmux-navigator"
  use "christoomey/vim-tmux-runner"

  -- Completion
  use "ms-jpq/coq_nvim"

  -- Themes
  use "RRethy/nvim-base16"
  use {
    "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
  }

  -- Other stuff
  use "tpope/vim-surround"
  use "junegunn/vim-easy-align"
  use "PeterRincker/vim-argumentative"
  use "ntpeters/vim-better-whitespace"
end)

-- Set <leader> to s and <localleader> to ss.
vim.opt.clipboard:append { "unnamedplus" }

vim.keymap.set("", "s", "<nop>")
vim.keymap.set("", "S", "<nop>")
vim.g.mapleader = "s"
vim.g.maplocalleader = "S"

vim.keymap.set({"n", "v"}, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+y$')

vim.keymap.set({"n", "v"}, "<leader>d", '"+d')
vim.keymap.set("n", "<leader>dd", '"+d$')

vim.keymap.set({"n", "v"}, "<leader>p", '"+p')
vim.keymap.set({"n", "v"}, "<leader>P", '"+P')

-- Swap . (repeat motion) and ; (next t/T/f/F match).
vim.keymap.set("n", ".", ";")
vim.keymap.set("n", ";", ".")

-- Remap Q (ex mode) to play macro q.
vim.keymap.set("", "Q", "@q")

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.autoindent = true
vim.opt.shiftwidth = 2

vim.opt.textwidth = 79
vim.opt.colorcolumn = "80"

vim.opt.listchars = {
  nbsp = "␣",
  tab = "▷ ",
}
vim.opt.list = true

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {"sumneko_lua"},
}

lsp = require("lspconfig")

lsp.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}

lsp.r_language_server.setup {
  settings = {
    r = {
      lsp = {
        diagnostics = false
      }
    }
  }
}


--lsp.jedi_language_server.setup {}
lsp.pylsp.setup {}


-- Coq setup
vim.g.coq_settings = {
  auto_start = "shut-up"
}
require("coq")

-- EasyAlign setup
vim.keymap.set({"n", "x"}, "ga", "<Plug>(EasyAlign)")


-- Tmux navigator setup
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set("n", "<C-w>h", ":TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-w>j", ":TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-w>k", ":TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-w>l", ":TmuxNavigateRight<cr>")

vim.keymap.set("n", "<leader><return>", ":VtrSendLinesToRunner<cr>j")
vim.keymap.set("v", "<leader><return>", ":VtrSendLinesToRunner<cr>`>j")
vim.keymap.set("n", "<leader><tab>", ":VtrAttachToPane<cr>")

require("lualine").setup()

-- Base16 setup
vim.opt.termguicolors = true
vim.cmd("colorscheme base16-solarized-light")
