local wez = require("wezterm")
local act = wez.action

local fn = require("user/functions")

local M = {}

M.config = {}

M.config.panes = {
  fn.map_key("LeftArrow", act.AdjustPaneSize { "Left", 1 }),
  fn.map_key("RightArrow", act.AdjustPaneSize { "Right", 1 }),
  fn.map_key("UpArrow", act.AdjustPaneSize { "Up", 1 }),
  fn.map_key("DownArrow", act.AdjustPaneSize { "Down", 1 }),
  fn.map_key("x", act.CloseCurrentPane { confirm = false } ),
  fn.map_key("Escape", act.PopKeyTable)
}

M.config.tabs = {
  fn.map_key("LeftArrow", act.ActivateTabRelativeNoWrap(-1)),
  fn.map_key("RightArrow", act.ActivateTabRelativeNoWrap(1)),
  fn.map_key({ "CTRL", "LeftArrow" }, act.MoveTabRelative(-1)),
  fn.map_key({ "CTRL", "RightArrow" }, act.MoveTabRelative(1)),
  fn.map_key("t", act.SpawnTab("CurrentPaneDomain")),
  fn.map_key("x", act.CloseCurrentTab { confirm = false }),
  fn.map_key("Escape", act.PopKeyTable)
}

M.config.font = {
  fn.map_key("=", act.ResetFontSize),
  fn.map_key({ "SHIFT", "+" }, act.IncreaseFontSize),
  fn.map_key("-", act.DecreaseFontSize),
  fn.map_key("Escape", act.PopKeyTable)
}

return M
