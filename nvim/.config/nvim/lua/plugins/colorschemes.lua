-- Factory function to load the plugin and invoke the colorscheme.
local config_colorscheme = function(scheme)
  return function(plugin, opts)
    require(plugin.name).setup(opts)
    vim.cmd("colorscheme " .. scheme)
  end
end

return {
  "tjdevries/colorbuddy.nvim",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, priority = 1000,
    config = config_colorscheme("catppuccin")
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    --lazy = false, priority = 1000,
    --config = config_colorscheme("rose-pine")
  },
  {
    -- A high-contrast theme.
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    tag = "v0.0.7",
    --lazy = false, priority = 1000,
    --config = config_colorscheme("github_dark")
  },
  {
    -- The light theme is very blue.
    "folke/tokyonight.nvim",
    name = "tokyonight",
    branch = "main",
    --lazy = false, priority = 1000,
    --config = config_colorscheme("tokyonight-day")
  },
  {
    "shaunsingh/solarized.nvim",
    name = "solarized",
    --lazy = false, priority = 1000,
    --config = function(plugin)
    --  require(plugin.name).set()
    --  vim.cmd("colorscheme solarized")
    --end
  },
  {
    -- Only dark.
    "svrana/neosolarized.nvim",
    name = "neosolarized",
    dependencies = "tjdevries/colorbuddy.nvim",
    --lazy = false, priority = 1000,
    --config = config_colorscheme("neosolarized")
  },
  {
    -- A very low-contrast theme.
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    --lazy = false, priority = 1000,
    --config = config_colorscheme("nordfox")
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    --lazy = false, priority = 1000,
    --config = config_colorscheme("gruvbox")
  },
  {
    -- This plugin is pretty broken as of Mar 2023.
    "RRethy/nvim-base16",
    name = "base16-colorscheme",
    enabled = false,
    --lazy = false, priority = 1000,
    --config = config_colorscheme("base16-solarized-light")
  },
}
