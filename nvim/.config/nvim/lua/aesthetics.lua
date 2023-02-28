-- Options related to aesthetics.
local opt = vim.opt


-- Shade the column after `textwidth`.
opt.colorcolumn = "+1"

-- Highlight line with cursor.
opt.cursorline = true

-- Display line numbers.
opt.number = true

-- Display tabs and non-breaking spaces as visible characters.
opt.list = true
opt.listchars = {
  tab = "▷ ",
  nbsp = "␣",
}

-- Use 24-bit color.
opt.termguicolors = true
opt.background = "light"

-- ???
opt.wildoptions = "pum"
opt.pumblend = 5
