local wez = require("wezterm")
local act = wez.action
local util = require("lib/util")
local opt = require("options")
local modes = require("cfg/modes")

local M = {}

local keys = {
  -- Mode switching
  util.map_key({ "LEADER", "F1" }, act.ShowDebugOverlay),
  util.map_key({ "LEADER", "c" }, act.ActivateCopyMode),
  util.map_key({ "LEADER", "f" }, util.activate_mode("font")),
  util.map_key({ "LEADER", "p" }, util.activate_mode("pane")),
  util.map_key({ "LEADER", "q" }, act.QuickSelect),
  util.map_key({ "LEADER", "t" }, util.activate_mode("tab")),
  util.map_key({ "LEADER", "w" }, act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" }),

  -- Buffer
  util.map_key({ "SHIFT", "PageUp" }, act.ScrollByPage(-1)),
  util.map_key({ "SHIFT", "PageDown" }, act.ScrollByPage(1)),
  util.map_key({ "LEADER", "/" }, act.Search { CaseInSensitiveString = "" }),
  util.map_key({ "CTRL", "l" }, act.Multiple {
  -- FIXME: This does nothing when connected to a mux
  -- Issue: https://github.com/wez/wezterm/issues/2624
    act.ClearScrollback("ScrollbackAndViewport"),
    act.SendKey { mods = "CTRL", key = "l" }
  }),
  -- Copy/paste
  util.map_key({ "SHIFT", "Insert" }, act.PasteFrom("PrimarySelection")),
  util.map_key({ "CTRL", "SHIFT", "Insert" }, act.PasteFrom("Clipboard")),
  util.map_key({ "CTRL", "c" }, wez.action_callback(util.maybe_copy)),
  -- Tabs
  util.map_key({ "LEADER", "CTRL", "LeftArrow" }, act.ActivateTabRelativeNoWrap(-1)),
  util.map_key({ "LEADER", "CTRL", "RightArrow" }, act.ActivateTabRelativeNoWrap(1)),
  util.map_key({ "LEADER", "CTRL", "Backspace" }, act.ActivateLastTab),
  util.map_key({ "LEADER", "1" }, act.ActivateTab(0)),
  util.map_key({ "LEADER", "2" }, act.ActivateTab(1)),
  util.map_key({ "LEADER", "3" }, act.ActivateTab(2)),
  util.map_key({ "LEADER", "4" }, act.ActivateTab(3)),
  util.map_key({ "LEADER", "5" }, act.ActivateTab(4)),
  util.map_key({ "LEADER", "6" }, act.ActivateTab(5)),
  util.map_key({ "LEADER", "7" }, act.ActivateTab(6)),
  util.map_key({ "LEADER", "8" }, act.ActivateTab(7)),
  util.map_key({ "LEADER", "9" }, act.ActivateTab(8)),
  util.map_key({ "LEADER", "Insert" }, act.SpawnTab("CurrentPaneDomain")),
  util.map_key({ "LEADER", "Delete" }, act.CloseCurrentTab { confirm = true }),
  -- Panes
  util.map_key({ "LEADER", "UpArrow" }, act.ActivatePaneDirection("Up")),
  util.map_key({ "LEADER", "DownArrow" }, act.ActivatePaneDirection("Down")),
  util.map_key({ "LEADER", "LeftArrow" }, act.ActivatePaneDirection("Left")),
  util.map_key({ "LEADER", "RightArrow" }, act.ActivatePaneDirection("Right")),
  util.map_key({ "LEADER", "-" }, act.SplitVertical { domain = "CurrentPaneDomain" }),
  util.map_key({ "LEADER", "SHIFT", "|" }, act.SplitHorizontal { domain = "CurrentPaneDomain" }),
  util.map_key({ "LEADER", "k" }, act.CloseCurrentPane { confirm = true }),
  util.map_key({ "LEADER", "z" }, act.TogglePaneZoomState),
  -- Misc
  util.map_key({ "LEADER", "\\" }, act.QuitApplication),
  util.map_key({ "LEADER", "SHIFT", "R" }, act.EmitEvent("config-reloaded")),
}

M.config = {
  debug_key_events = opt.debug,
  disable_default_key_bindings = true,
  keys = keys,
  key_tables = modes,
  leader = util.map_leader(opt.leader_key, opt.leader_timeout),
  use_dead_keys = false
}

return M
