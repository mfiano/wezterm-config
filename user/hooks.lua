local wez = require("wezterm")
local mux = wez.mux

local fn = require("user/functions")
local theme = require("user/theme")

wez.on("update-right-status", function(window)
  local key_table = window:active_key_table()
  local text_items = {}
  if key_table then
    text_items = {
      theme.text_item { text = " mode ", fg = "grey1", bg = "blue", bold = true },
      theme.text_item { text = " " .. key_table .. " ", fg = "white1", bg = "grey1", bold = true }
    }
  end
  local text = fn.format_text(text_items)
  window:set_right_status(text)
end)

wez.on("format-tab-title", function(tab)
  local mux_window = mux.get_window(tab.window_id)
  local workspace = mux_window:get_workspace()
  local title = tab.active_pane.title
  local title_color = tab.is_active and "white2" or "grey2"
  local text_items = {
    theme.text_item { text = " " .. workspace, fg = "blue", bg = "grey1", bold = true },
    theme.text_item { text = " " .. title, fg = title_color, bg = "grey1", bold = false },
  }
  return fn.format_text(text_items)
end)
