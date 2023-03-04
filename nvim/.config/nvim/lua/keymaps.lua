local keymap = vim.keymap

-- Set <leader> to s and <localleader> to S.
keymap.set("", "s", "<nop>")
keymap.set("", "S", "<nop>")
vim.g.mapleader = "s"
vim.g.maplocalleader = "S"

-- Swap . (repeat motion) and ; (next t/T/f/F match).
keymap.set("n", ".", ";")
keymap.set("n", ";", ".")

-- Move up/down visual lines.
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("n", "<down>", "gj")
keymap.set("n", "<up>", "gk")

-- Remap Q (ex mode) to play macro q.
vim.keymap.set("n", "Q", "@q")

-- Increment/decrement keys.
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all.
keymap.set("v", "aa", "<esc>ggVG")

