local wez = require("wezterm")
local act = wez.action

local fn = require("user/functions")
local modes = require("user/modes")

local M = {}

local key_groups = {}

key_groups.modes = {
  fn.map_key({ "LEADER", "f" }, fn.activate_key_table("font", 3000)),
  fn.map_key({ "LEADER", "r" }, fn.activate_key_table("panes", 3000)),
  fn.map_key({ "LEADER", "t" }, fn.activate_key_table("tabs", 3000))
}

key_groups.tab_navigation = {
  fn.map_key({ "LEADER", "1" }, act.ActivateTab(0)),
  fn.map_key({ "LEADER", "2" }, act.ActivateTab(1)),
  fn.map_key({ "LEADER", "3" }, act.ActivateTab(2)),
  fn.map_key({ "LEADER", "4" }, act.ActivateTab(3)),
  fn.map_key({ "LEADER", "5" }, act.ActivateTab(4)),
  fn.map_key({ "LEADER", "6" }, act.ActivateTab(5)),
  fn.map_key({ "LEADER", "7" }, act.ActivateTab(6)),
  fn.map_key({ "LEADER", "8" }, act.ActivateTab(7)),
  fn.map_key({ "LEADER", "9" }, act.ActivateTab(8))
}

key_groups.pane_manipulation = {
  fn.map_key({ "LEADER", "SHIFT", "|" }, act.SplitHorizontal { domain = "CurrentPaneDomain" }),
  fn.map_key({ "LEADER", "-" }, act.SplitVertical { domain = "CurrentPaneDomain" })
}

key_groups.pane_navigation = {
  fn.map_key({ "LEADER", "UpArrow" }, act.ActivatePaneDirection("Up")),
  fn.map_key({ "LEADER", "DownArrow" }, act.ActivatePaneDirection("Down")),
  fn.map_key({ "LEADER", "LeftArrow" }, act.ActivatePaneDirection("Left")),
  fn.map_key({ "LEADER", "RightArrow" }, act.ActivatePaneDirection("Right")),
  fn.map_key({ "LEADER", "w" }, act.PaneSelect)
}

key_groups.copy_paste = {
  fn.map_key({ "SHIFT", "Insert" }, act.PasteFrom("PrimarySelection")),
  fn.map_key({ "LEADER", "SHIFT", "Insert" }, act.PasteFrom("Clipboard")),
  fn.map_key({ "CTRL", "c" }, wez.action_callback(fn.maybe_copy)),
  fn.map_key({ "LEADER", "Escape" }, act.ActivateCopyMode)
}

key_groups.debug = {
  fn.map_key({ "LEADER", "SHIFT", "R" }, act.ReloadConfiguration),
  fn.map_key({ "CTRL", "SHIFT", "L" }, act.ShowDebugOverlay)
}

key_groups.text_buffer = {
  fn.map_key({ "SHIFT", "PageUp" }, act.ScrollByPage(-1)),
  fn.map_key({ "SHIFT", "PageDown" }, act.ScrollByPage(1)),
  fn.map_key({ "LEADER", "/" }, act.Search("CurrentSelectionOrEmptyString")),
  fn.map_key({ "LEADER", "CTRL", ";" }, act.Multiple {
    act.ClearScrollback("ScrollbackAndViewport"),
    act.SendKey { mods = "CTRL", key = "L" }
  }),
  fn.map_key({ "LEADER", "c" }, act.CharSelect {
    copy_on_select = true,
    copy_to = "ClipboardAndPrimarySelection",
  })
}

key_groups.domain_connect = {
  fn.map_key({ "CTRL", "SHIFT", "U" }, act.AttachDomain "vps"),
}

M.config = {
  disable_default_key_bindings = true,
  keys = fn.flatten_list(key_groups),
  key_tables = modes.config,
  leader = { key = "phys:CapsLock", timeout = 350 },
  use_dead_keys = false
}

return M
