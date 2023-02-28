-- Base Configuration
--
-- See also:
--    * `:help lua` or <https://neovim.io/doc/user/lua.html>
--    * `:help lua-guide` or <https://neovim.io/doc/user/lua-guide.html>

-- Clear all autocommands.
vim.cmd("autocmd!")


-- Splits
--
-- Split left-to-right and top-to-bottom.
vim.opt.splitright = true
vim.opt.splitbelow = true


-- Display
--
-- Display line numbers.
vim.wo.number = true
vim.opt.textwidth = 79
vim.opt.colorcolumn = "80"
-- Keep 10 lines visible above and below the cursor.
vim.opt.scrolloff = 8
-- Display tabs and non-breaking spaces as visible characters.
vim.opt.list = true
vim.opt.listchars = {
  tab = "▷ ",
  nbsp = "␣",
}


-- Indentation
--
-- A tab/backspace press is equal to the number of spaces to the next soft tab
-- stop (determined by `softtabstop`). If `smarttab` is set, then a
-- tab/backspace press at the beginning of a line is instead equal to
-- `shiftwidth` spaces. When `softtabstop` is negative, it has the same value
-- as `shiftwidth`, so the `smarttab` setting is irrelevant.
--
vim.opt.expandtab = true    -- tab press inserts spaces
vim.opt.tabstop = 2         -- spaces per tab character
vim.opt.shiftwidth = 0      -- spaces per indent; 0 means tabstop
vim.opt.softtabstop = -1    -- spaces per soft tab stop; -1 means shiftwidth

-- Indent wrapped lines to the same level as the first line.
vim.opt.breakindent = true
vim.opt.smartindent = true


-- Search & Substitution
--
-- Preview substitute results in separate pane.
vim.opt.inccommand = "split"
-- Ignore case in searches unless the pattern has uppercase characters.
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- Defaults to `tcqj`.
vim.opt.formatoptions:append("rn")
-- `r`  continue comments on new lines in insert mode
-- `n`  smart handling of numbered lists

-- TODO: probably nice to have in Markdown docs
-- `a`  automatically reformat (`gq`) paragraphs in comments
-- `w`  trailing whitespace indicates continued paragraph

vim.opt.formatoptions:remove("lo")
-- `l`  prevents long lines from being broken in insert mode
-- `o` continues comments on new lines with `o` in normal mode


-- Always report unsaved changes when quitting.
vim.opt.report = 0
