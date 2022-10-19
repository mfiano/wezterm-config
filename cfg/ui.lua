local wez = require("wezterm")
local opt = require("options")
local color = opt.colors

local M = {}

M.config = {
  adjust_window_size_when_changing_font_size = false,
  animation_fps = M.animation_fps,
  colors = {
    background = color.background,
    cursor_bg = color.cursor_bg,
    cursor_fg = color.cursor_fg,
    cursor_border = color.cursor_inactive,
    split = color.split,
    ansi = color.ansi,
    brights = color.bright,
    tab_bar = {
      active_tab = {
        bg_color = color.tab_active_bg,
        fg_color = color.tab_active_fg,
        intensity = "Normal"
      },
      inactive_tab = {
        bg_color = color.tab_inactive_bg,
        fg_color = color.tab_inactive_fg,
        italic = false
      },
      inactive_tab_hover = {
        bg_color = color.tab_inactive_bg,
        fg_color = color.tab_inactive_fg
      }
    }
  },
  cursor_thickness = opt.cursor_height,
  custom_block_glyphs = true,
  default_cursor_style = "SteadyUnderline",
  detect_password_input = true,
  enable_scroll_bar = false,
  enable_tab_bar = true,
  font = wez.font_with_fallback {
    { family = opt.font, weight = opt.font_weight },
    "Noto Color Emoji"
  },
  font_size = opt.font_size,
  hide_tab_bar_if_only_one_tab = false,
  max_fps = opt.max_fps,
  pane_focus_follows_mouse = true,
  show_tab_index_in_tab_bar = true,
  skip_close_confirmation_for_processes_named = { "bash" },
  status_update_interval = 350,
  switch_to_last_active_tab_when_closing_tab = true,
  tab_max_width = opt.tab_width,
  use_cap_height_to_scale_fallback_fonts = true,
  use_fancy_tab_bar = true,
  use_resize_increments = true,
  visual_bell = {
    fade_in_duration_ms = 150,
    fade_in_function = "EaseIn",
    fade_out_duration_ms = 150,
    fade_out_function = "EaseOut",
    target = "CursorColor",
  },
  warn_about_missing_glyphs = false,
  window_close_confirmation = "AlwaysPrompt",
  window_decorations = "NONE",
  window_frame = {
    font = wez.font { family = opt.titlebar_font, weight = opt.titlebar_font_weight },
    font_size = opt.titlebar_font_size,
    inactive_titlebar_bg = color.titlebar_active_bg,
    active_titlebar_bg = color.titlebar_inactive_bg,
  },
  window_padding = { left = "0.5cell", right = "0.5cell", top = "0.5cell", bottom = "0.5cell" }
}

return M
