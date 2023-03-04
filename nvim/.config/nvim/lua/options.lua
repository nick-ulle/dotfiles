-- Options related to behavior.
local opt = vim.opt


opt.textwidth = 79

-- Keep 10 lines visible above and below the cursor.
opt.scrolloff = 8

-- Split left-to-right and top-to-bottom.
opt.splitright = true
opt.splitbelow = true

-- Always report unsaved changes when quitting.
opt.report = 0

-- Indentation
--
-- A tab/backspace press is equal to the number of spaces to the next soft tab
-- stop (determined by `softtabstop`). If `smarttab` is set, then a
-- tab/backspace press at the beginning of a line is instead equal to
-- `shiftwidth` spaces. When `softtabstop` is negative, it has the same value
-- as `shiftwidth`, so the `smarttab` setting is irrelevant.
--
opt.expandtab = true    -- tab press inserts spaces
opt.tabstop = 2         -- spaces per tab character
opt.shiftwidth = 0      -- spaces per indent; 0 means tabstop
opt.softtabstop = -1    -- spaces per soft tab stop; -1 means shiftwidth

-- Indent wrapped lines to the same level as the first line.
opt.breakindent = true
opt.smartindent = true

-- Search & Substitution
--
-- Preview substitute results in separate pane.
opt.inccommand = "split"
-- Ignore case in searches unless the pattern has uppercase characters.
opt.ignorecase = true
opt.smartcase = true

-- See `:help ft-python-indent`.
-- Indent continuations 4 spaces in Python.
vim.g.python_indent = {
  disable_parentheses_indenting = false,
  closed_paren_align_last_line = false,
  continue = 4,
  open_paren = 4,
  nested_paren = 4,
}

-- See `:help ft-r-indent`.
-- Don't align function arguments in R.
vim.g.r_indent_align_args = 0
