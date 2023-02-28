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

-- Formatting
--
-- Defaults to `tcqj`.
opt.formatoptions:append("rn")
-- `r`  continue comments on new lines in insert mode
-- `n`  smart handling of numbered lists

-- TODO: probably nice to have in Markdown docs
-- `a`  automatically reformat (`gq`) paragraphs in comments
-- `w`  trailing whitespace indicates continued paragraph

opt.formatoptions:remove("lo")
-- `l`  prevents long lines from being broken in insert mode
-- `o` continues comments on new lines with `o` in normal mode
