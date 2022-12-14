local wez = require("wezterm")
local opt = require("options")
local util = require("lib/util")
local txt = require("lib/text")
local win = require("lib/window")

local M = {}

wez.on("config-reloaded", function(window, pane)
  wez.GLOBAL.reload_notify = true
  window:perform_action(wez.action.ReloadConfiguration, pane)
end)

wez.on("window-config-reloaded", function(window)
  if opt.auto_reload or wez.GLOBAL.reload_notify then
    util.notify(window, "reloaded", 1500)
    wez.GLOBAL.reload_notify = false
  end
end)

wez.on("format-tab-title", function(tab)
  return txt.tab_text(tab)
end)

wez.on("update-right-status", function(window)
  local text = txt.mode_text(window)
  window:set_right_status(text)
end)

wez.on("update-status", function(window, pane)
  local text = txt.domain_workspace_text(window, pane)
  window:set_left_status(text)
end)

wez.on("bell", function(window, pane)
  local text = "notify on pane: " .. pane.get_title()
  util.notify(window, text)
end)

wez.on("mux-startup", function()
  win.make_workspaces(opt.workspaces)
end)

M.config = {}

return M
