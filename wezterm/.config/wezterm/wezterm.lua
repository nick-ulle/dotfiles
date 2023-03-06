local wt = require("wezterm")

return {
  font = wt.font("Hack Nerd Font"),
  font_size = 13.3,

  disable_default_key_bindings = true,
  --debug_key_events = true,
  keys = {
    {
      -- CapsLock as S-F2
      key = "phys:CapsLock",
      action = wt.action.SendKey {
        key = "F2",
        mods = "SHIFT"
      }
    }
  },

  enable_tab_bar = false,
  --use_fancy_tab_bar = false,
  --tab_bar_at_bottom = true,
  --window_frame = {
  --  font = wt.font("Hack Nerd Font"),
  --  font_size = 23.3,
  --  --active_titlebar_bg = "#ff0000"
  --}

  --colors = {
  --  cursor_fg = "transparent",
  --  cursor_bg = "white",
  --  cursor_border = "white"
  --},

  window_padding = {
    top = 4,
    bottom = 4,
    right = 4,
    left = 4,
  },
}
