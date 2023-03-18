local ut = {}


-- Lua API
-- -------------------------------------

-- Find endpoints of Vim WORD under the given index.
function ut.find_word_under(line, i)
    local head = line:sub(1, i)
    local start = head:find("[^%s]+$")

    local tail = line:sub(i)
    local stop = tail:find("%s") or tail:len() + 1
    stop = stop + i - 2

    return start, stop
end


-- Add a number to a hex code.
function ut.hex_add(hex, x, max)
  local val = tonumber("0x" .. hex)
  val = math.min(val + x, max)
  return ("%x"):format(val)
end


-- Switch statement that uses the current Vim mode as the control value.
function ut.switch_by_mode(table)
  local mode = vim.api.nvim_get_mode()["mode"]
  return table[mode] or table.default
end


-- Send keys (after safely converting key codes).
function ut.send_keys(keys, mode)
    mode = mode or "nt"
    keys = vim.api.nvim_replace_termcodes(keys, true, true, true)
    vim.api.nvim_feedkeys(keys, mode, false)
end


-- Vim API
-- -------------------------------------

-- Get cursor column number.
-- The charcol function gets the correct column for multibyte characters.
function ut.get_cursor_col_num()
  return vim.fn.charcol(".")
end

-- Get the line under the cursor.
function ut.get_cursor_line()
    local ll = vim.fn.line(".")
    return vim.api.nvim_buf_get_lines(0, ll - 1, ll, true)[1]
end


-- Get the character that immediately precedes the cursor or nil.
function ut.get_cursor_prev_char()
  local prev = ut.get_cursor_col_num() - 1
  if prev <= 0 then
    return nil
  else
    return ut.get_cursor_line():sub(prev, prev)
  end
end


-- Keyhacks
-- -------------------------------------

-- Select just the column that contains the cursor.
function ut.keys_select_cursor_column()
  local r1 = vim.fn.line("v")
  local r2 = vim.fn.line(".")
  local c = ut.get_cursor_col_num()
  if r1 > r2 then
    r1, r2 = r2, r1
  end
  return string.format("<esc>%dgg%d|<C-v>%dgg%d|o", r1, c, r2, c)
end


return ut
