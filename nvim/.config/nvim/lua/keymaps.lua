local keymap = vim.keymap
local ut = require("utilities")

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


-- Select all.
keymap.set("n", "<leader>a", "vgg0oG$", { desc = "Select all" })
keymap.set("v", "<leader>a", --"<esc>ggVG")
  function()
    local keys = ut.switch_by_mode {
      v = "v",
      default = "<C-v>",
      V = "V",
    }
    -- `< moves to the beginning of the previous selection.
    keys = "<esc>`<" .. keys .. "gg0oG$"
    ut.send_keys(keys)
  end,
  { desc = "all" }
)


-- Weird stuff --------------------
-- Make v cycle modes in visual mode.
-- keymap.set("n", "v", "v.", { desc = "Cycle visual modes" })
keymap.set("v", "v",
  function()
    local keys = ut.switch_by_mode {
      v = "V",
      V = "<C-v>",
      default = "v",
    }
    ut.send_keys(keys)
  end,
  { desc = "Cycle visual modes" }
)
keymap.set({"n", "v"}, "<C-v>", "<nop>")
keymap.set({"n", "v"}, "V", "<nop>")


-- Make I, A, ; switch from any visual mode to visual block insert mode.
keymap.set("v", "I",
  function()
    local keys = ut.keys_select_cursor_column() .. "I"
    ut.send_keys(keys)
  end,
  { desc = "Block insert mode" }
)
keymap.set("v", ";", "I", {
  remap = true, desc = "Block insert mode"
})

keymap.set("v", "A",
  function()
    local keys = ut.keys_select_cursor_column() .. "A"
    ut.send_keys(keys)
  end,
  { desc = "Block insert mode (append)" }
)


-- Experiment with incrementing hex codes.
keymap.set("n", "<leader>d",
  function()
    local line = ut.get_cursor_line()
    local c = ut.get_cursor_col_num()

    -- Find the endpoints of the WORD under the cursor.
    local start, stop = ut.find_word_under(line, c)
    local word = line:sub(start, stop)
    print("cursor at " .. c)
    print(("(%d, %d): %s"):format(start, stop, word))

    -- If WORD doesn't begin with `#`, it's not a hex code.
    if word:sub(1, 1) ~= "#" then
      ut.send_keys("<C-a>")
      return
    end
    word = word:sub(2)

    c = c - start
    print("Detected hexcode, cursor at " .. c)
    local n = word:len()
    print("Len (" .. word .. ") " .. n)

    local keys = "<C-a>"
    if n == 3 then
      local hex = word:sub(c, c)
      -- Increment and replace.
      hex = ut.hex_add(hex, 1, 15)
      keys = "cl" .. hex .. "<esc>"

    elseif n == 6 or n == 8 then
      -- Get the hex byte under the cursor.
      local is_even = c % 2 == 0
      c = is_even and c - 1 or c
      local hex = word:sub(c, c + 1)
      -- Increment and replace.
      hex = ut.hex_add(hex, 1, 255)
      keys = "c2l" .. hex .. "<esc>"
      keys = is_even and "h" .. keys or keys .. "h"
    end
    ut.send_keys(keys)
    --
    -- local num = tonumber(word)
    -- if num == nil then
    --   print("Invalid string")
    --   return
    -- end
    --
    -- print("Pos1 is " .. vim.fn.charcol("."))
    -- send_keys("B")
    -- print("Pos2 is " .. vim.fn.charcol("."))
    --
    -- num = num + 1
    -- word = string.format("%s%x", prefix, num)
    -- print(word)
    -- send_keys("ciW" .. word .. "<esc>")
  end
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
