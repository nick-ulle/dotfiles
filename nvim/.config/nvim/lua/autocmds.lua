local optl = vim.opt_local
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Clear all autocommands.
vim.cmd("autocmd!")


-- Treat .Rprofile files as R files.
autocmd({"BufNewFile", "BufRead"}, {
  pattern = {".Rprofile", "rprofile"},
  group = augroup("rprofile", {clear = true}),
  callback = function()
    optl.filetype = "r"
  end
})


-- Treat BUGS files as R files.
autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.bug",
  group = augroup("bugs", {clear = true}),
  callback = function()
    optl.filetype = "r"
  end
})


-- Enable spell-checking for text formats.
autocmd({"FileType"}, {
  pattern = {"text", "markdown", "rmd", "gitcommit"},
  group = augroup("spell", {clear = true}),
  callback = function()
    optl.spell = true
    optl.spelllang = "en_us"
  end
})


-- Set formatoptions for all buffers.
-- Necessary because some naughty ftplugins override formatoptions.
autocmd({"VimEnter", "FileType"}, {
  pattern = "*",
  group = augroup("formatoptions", {clear = true}),
  callback = function()
    optl.formatoptions:append("cjnrt")
      -- `c`  auto-wrap comments
      -- `j`  remove comment leader when joining comment lines
      -- `n`  smart handling of numbered lists
      -- `r`  continue comments on new lines in insert mode
      -- `t`  auto-wrap text
    optl.formatoptions:remove({"l", "o"})
      -- `l`  prevent long lines from being broken in insert mode
      -- `o`  continue comments on new lines with `o` in normal mode
    end
})


-- Python
autocmd({"FileType"}, {
  pattern = "python",
  group = augroup("python", {clear = true}),
  callback = function()
    -- Use 4 spaces per tab, as per PEP8.
    optl.tabstop = 4
  end
})


-- Git commit messages
autocmd({"FileType"}, {
  pattern = "gitcommit",
  group = augroup("git", {clear = true}),
  callback = function()
    optl.textwidth = 72
  end
})
