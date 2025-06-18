-- See also:
--    * `:help lua` or <https://neovim.io/doc/user/lua.html>
--    * `:help lua-guide` or <https://neovim.io/doc/user/lua-guide.html>
require("options")
require("aesthetics")
require("keymaps")
require("autocmds")
require("lsp")

local has = function(x)
  return vim.fn.has(x) == 1
end

if has("linux") then
  require("linux")
end

-- Set up Lazy.nvim to load plugins.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Import plugins in the `lua/plugins/` subdirectory.
    { import = "plugins" },
  },
  -- Automatically check for plugin updates.
  checker = { enabled = true },
})
