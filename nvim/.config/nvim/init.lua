-- See also:
--    * `:help lua` or <https://neovim.io/doc/user/lua.html>
--    * `:help lua-guide` or <https://neovim.io/doc/user/lua-guide.html>
require("options")
require("aesthetics")
require("keymaps")
require("autocmds")

local has = function(x)
  return vim.fn.has(x) == 1
end

if has("linux") then
  require("linux")
end

-- Set up Lazy.nvim to load plugins.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
