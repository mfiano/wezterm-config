local wez = require("wezterm")

local M = {}

M.config = {
  adjust_window_size_when_changing_font_size = false,
  animation_fps = 30,
  default_cursor_style = "SteadyUnderline",
  font = wez.font_with_fallback {
    { family = "Iosevka Term", weight = "Regular" },
    "Noto Color Emoji"
  },
  font_size = 12,
  pane_focus_follows_mouse = true,
  tab_max_width = 20,
  use_fancy_tab_bar = false,
  visual_bell = {
    fade_in_duration_ms = 150,
    fade_in_function = "EaseIn",
    fade_out_duration_ms = 150,
    fade_out_function = "EaseOut",
    target = "CursorColor",
  },
  warn_about_missing_glyphs = false,
  window_close_confirmation = "NeverPrompt",
  window_frame = { font = wez.font { family = "Iosevka Aile", weight = "Bold" }, font_size = 10 },
  window_padding = { left = "0.5cell", right = "0.5cell", top = "0.5cell", bottom = "0.5cell" }
}

return M
