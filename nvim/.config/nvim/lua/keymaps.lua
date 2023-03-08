local keymap = vim.keymap

-- Set <leader> to s and <localleader> to S.
keymap.set("", "s", "<nop>")
keymap.set("", "S", "<nop>")
vim.g.mapleader = "s"
vim.g.maplocalleader = "S"

-- Move up/down visual lines.
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("n", "<down>", "gj", { desc = "Down" })
keymap.set("n", "<up>", "gk", { desc = "Up" })

-- Increment/decrement keys.
keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- Remap Q (ex mode) to play macro q.
keymap.set("n", "Q", "@q", { desc = "Play macro q" })


-- Helper functions -----------------------------
-- Select a value based on the mode.
local select_by_mode = function(table)
  local mode = vim.api.nvim_get_mode()["mode"]
  return table[mode] or table.default
end

-- Feed keys, safely converting key codes.
local safe_feedkeys = function(keys, mode)
    mode = mode or "nt"
    keys = vim.api.nvim_replace_termcodes(keys, true, true, true)
    vim.api.nvim_feedkeys(keys, mode, false)
end

-- Select just the column that contains the cursor.
-- FIXME: Seems to break on multibyte characters.
local keys_select_cursor_column = function()
  local r1 = vim.fn.line("v")
  local r2 = vim.fn.line(".")
  local c = vim.fn.charcol(".")
  if r1 > r2 then
    r1, r2 = r2, r1
  end
  return string.format("<esc>%dgg%d|<C-v>%dgg%d|o", r1, c, r2, c)
end
-------------------------------------------------


-- Select all.
keymap.set("n", "<leader>a", "vgg0oG$", { desc = "Select all" })
keymap.set("v", "<leader>a", --"<esc>ggVG")
  function()
    local mode_key = select_by_mode {
      v = "v",
      default = "<C-v>",
      V = "V",
    }
    -- `< moves to the beginning of the previous selection.
    local keys = "<esc>`<" .. mode_key .. "gg0oG$"
    safe_feedkeys(keys)
  end,
  { desc = "all" }
)


-- Weird stuff --------------------
-- Make v cycle modes in visual mode.
-- keymap.set("n", "v", "v.", { desc = "Cycle visual modes" })
keymap.set("v", "v",
  function()
    local key = select_by_mode {
      v = "V",
      V = "<C-v>",
      default = "v",
    }
    safe_feedkeys(key)
  end,
  { desc = "Cycle visual modes" }
)
keymap.set({"n", "v"}, "<C-v>", "<nop>")
keymap.set({"n", "v"}, "V", "<nop>")


-- Make I, A, ; switch from any visual mode to visual block insert mode.
keymap.set("v", "I",
  function()
    local keys = keys_select_cursor_column() .. "I"
    safe_feedkeys(keys)
  end,
  { desc = "Block insert mode" }
)
keymap.set("v", ";", "I", {
  remap = true, desc = "Block insert mode"
})

keymap.set("v", "A",
  function()
    local keys = keys_select_cursor_column() .. "A"
    safe_feedkeys(keys)
  end,
  { desc = "Block insert mode (append)" }
)


-- Move , (prev t/T/f/F match) to <
-- Put << (dedent) to on ,
keymap.set("n", "<", ",", { desc = "Prev f/F/t/T result" })
keymap.set("v", "<", ",", { desc = "Prev f/F/t/T result" })
keymap.set("n", ",", "<<", { desc = "Dedent line" })
keymap.set("v", ",", "<", { desc = "Dedent line" })

-- Move . (repeat) to ;
-- Move ; (next t/T/f/F match) to >
-- Put >> (indent) to on ,
keymap.set("n", ";", ".", { desc = "Repeat operation" })
keymap.set("n", ">", ";", { desc = "Next f/F/t/T result" })
keymap.set("v", ">", ";", { desc = "Next f/F/t/T result" })
keymap.set("n", ".", ">>", { desc = "Indent line" })
keymap.set("v", ".", ">", { desc = "Indent line" })

-- Traverse search results with space and backspace.
keymap.set("n", "<space>", "n", { desc = "Next search result" })
keymap.set("n", "<backspace>", "N", { desc = "Previous search result" })

-- Make w/W select inner w/Word.
keymap.set("o", "w", "iw", { desc = "Inner word" })
-- keymap.set("v", "w", "iw")
keymap.set("o", "W", "iW", { desc = "Inner WORD" })
-- keymap.set("v", "W", "iW")
