local loc = require("local")

local black = "#1f1f1f"
local red = "#e06c75"
local green = "#98c379"
local yellow = "#d19a66"
local blue = "#61afef"
local magenta = "#c678dd"
local cyan = "#56b6c2"
local white1 = "#ffffff"
local white2 = "#abb2bf"
local grey1 = "#262626"
local grey2 = "#666666"
local grey3 = "#5c6379"

return {
  animation_fps = 30,
  auto_reload = true,
  colors = {
    ansi = { black, red, green, yellow, blue, magenta, cyan, white2 },
    background = grey1,
    bright = { grey3, red, green, yellow, blue, magenta, cyan, white1 },
    cursor_bg = blue,
    cursor_fg = black,
    cursor_inactive = grey2,
    domain_bg = grey1,
    domain_fg = red,
    mode_bg = grey1,
    mode_fg = white1,
    mode_label_bg = blue,
    mode_label_fg = grey1,
    split = grey2,
    tab_active_bg = grey1,
    tab_active_fg = blue,
    tab_inactive_bg = grey1,
    tab_inactive_fg = grey2,
    tab_urgent_bg = red,
    tab_urgent_fg = grey1,
    titlebar_active_bg = grey1,
    titlebar_inactive_bg = grey1,
    workspace_bg = grey1,
    workspace_fg = red
  },
  cursor_height = "200%",
  debug = false,
  font = "IosevkaTermSlab Nerd Font",
  font_size = 12.5,
  font_weight = "Regular",
  leader_key = { "CTRL", "a" },
  leader_timeout = 1,
  max_fps = 60,
  tab_width = 20,
  titlebar_font = "Iosevka Term",
  titlebar_font_size = 12.5,
  titlebar_font_weight = "Bold",
  remote_muxers = loc.remote_muxers,
  workspaces = loc.workspaces
}
