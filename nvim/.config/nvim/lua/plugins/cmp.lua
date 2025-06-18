local ut = require("utilities")

local function set_hl_bg_to_fg(from, to)
  -- The Normal highlight group contains the default buffer background color.
  local norm = vim.api.nvim_get_hl_by_name("Normal", true)
  local colors = vim.api.nvim_get_hl_by_name(to, true)
  vim.api.nvim_set_hl(0, from, {
    fg = norm.background, bg = colors.foreground
  })
end

-- Treesitter groups begin with `@`, but some of them are linked, so for those,
-- use the regular syntax highlighting groups.
local kinds = {
  Class         = { icon = "ﴯ", link = "Type" },
  Color         = { icon = "", link = "@text" },
  Constant      = { icon = "", link = "Constant" },
  Constructor   = { icon = "", link = "@constructor" },
  Enum          = { icon = "", link = "@enum" },
  EnumMember    = { icon = "", link = "@enumMember" },
  Event         = { icon = "", link = "@event" },
  Field         = { icon = "", link = "@field" },
  File          = { icon = "", link = "Type" },
  Folder        = { icon = "", link = "Type" },
  Function      = { icon = "", link = "Function" },
  Interface     = { icon = "", link = "@interface" },
  Keyword       = { icon = "", link = "Keyword" },
  Method        = { icon = "", link = "@method" },
  Module        = { icon = "", link = "@namespace" },
  Operator      = { icon = "", link = "Operator" },
  Property      = { icon = "ﰠ", link = "@property" },
  Reference     = { icon = "", link = "@text" },
  Snippet       = { icon = "", link = "String" },
  Struct        = { icon = "", link = "@struct" },
  Text          = { icon = "", link = "Comment" },
  TypeParameter = { icon = "", link = "@typeParameter" },
  Unit          = { icon = "", link = "@text" },
  Value         = { icon = "", link = "Constant" },
  Variable      = { icon = "", link = "@variable" },
}

local sources = {
  nvim_lsp = { icon = "λ" },
  snippy   = { icon = "⋗" },
  buffer   = { icon = "Ω" },
  path     = { icon = "…" },
  tmux     = { icon = "𝕋" },
  otter    = { icon = "O" },
}

return {
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "dcampos/nvim-snippy",
      "dcampos/cmp-snippy",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "andersevenrud/cmp-tmux",
      -- "jmbuhr/otter.nvim",
    },
    config = function()
      local cmp = require("cmp")

      local function cmp_select_next(fallback)
        local snippy = require("snippy")
        if cmp.visible() then
          cmp.select_next_item()
        elseif snippy.can_expand_or_advance() then
          snippy.expand_or_advance()
        else
          fallback()
        end
      end

      local function cmp_select_prev(fallback)
        local snippy = require("snippy")
        if cmp.visible() then
          cmp.select_prev_item()
        elseif snippy.can_jump(-1) then
          snippy.previous()
        else
          fallback()
        end
      end

      cmp.setup {
        snippet = {
          expand = function(args)
            require("snippy").expand_snippet(args.body)
          end
        },
        window = {
          completion = {
            side_padding = 0,
          }
        },
        mapping = {
          -- Second argument to cmp.mapping is modes.
          ["<Tab>"] = cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.confirm({ select = true })
                return
              end

              local snippy = require("snippy")
              if snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
                return
              end

              -- If the preceding character is not whitespace, open completion
              -- menu instead of sending <Tab>.
              local prev_char = ut.get_cursor_prev_char()
              if prev_char and prev_char:find("[^%s]") then
                cmp.complete()
              else
                fallback()
              end
            end, { "i" }
          ),
          ["<Up>"]    = cmp.mapping(cmp_select_prev, { "i" }),
          ["<Down>"]  = cmp.mapping(cmp_select_next, { "i" }),
          ["<Left>"]  = cmp.mapping.abort(),
          ["<Right>"] = cmp.mapping.confirm({ select = true }),
          ["<PageUp>"] = cmp.mapping.scroll_docs(-8),
          ["<PageDown>"] = cmp.mapping.scroll_docs(8),
        },
        sources = {
          { name = "nvim_lsp" },
          -- { name = "otter" },
          { name = "snippy" },
          { name = "buffer" },
          { name = "tmux",
            option = {
              all_panes = true
            }
          },
          { name = "path",
            option = {
              trailing_slash = true
            }
          },
        },
        formatting = {
          fields = {"kind", "menu", "abbr"},
          format = function(entry, item)
            item.kind = " " .. kinds[item.kind].icon .. " "
            item.menu = sources[entry.source.name].icon .. " "
            return item
          end,
        },
      }

      -- Set up colors.
      for k, v in pairs(kinds) do
        set_hl_bg_to_fg("CmpItemKind" .. k, v.link)
      end
      vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "Comment" })
    end
  }
}
