local act = require("wezterm").action
local util = require("lib/util")

return {
  dispatch = {
    util.map_key("F1", act.ShowDebugOverlay),
    util.map_key("c", act.ActivateCopyMode),
    util.map_key("f", util.activate_mode("font")),
    util.map_key("p", util.activate_mode("pane")),
    util.map_key("q", act.QuickSelect),
    util.map_key("t", util.activate_mode("tab")),
    util.map_key("w", act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" })
  },
  font = {
    util.map_key("=", act.ResetFontSize),
    util.map_key({ "SHIFT", "+" }, act.IncreaseFontSize),
    util.map_key("-", act.DecreaseFontSize),
    util.map_key("Escape", act.PopKeyTable)
  },
  tab = {
    util.map_key("1", act.ActivateTab(0)),
    util.map_key("2", act.ActivateTab(1)),
    util.map_key("3", act.ActivateTab(2)),
    util.map_key("4", act.ActivateTab(3)),
    util.map_key("5", act.ActivateTab(4)),
    util.map_key("6", act.ActivateTab(5)),
    util.map_key("7", act.ActivateTab(6)),
    util.map_key("8", act.ActivateTab(7)),
    util.map_key("9", act.ActivateTab(8)),
    util.map_key("LeftArrow", act.ActivateTabRelativeNoWrap(-1)),
    util.map_key("RightArrow", act.ActivateTabRelativeNoWrap(1)),
    util.map_key({ "CTRL", "LeftArrow" }, act.MoveTabRelative(-1)),
    util.map_key({ "CTRL", "RightArrow" }, act.MoveTabRelative(1)),
    util.map_key("Escape", act.PopKeyTable)
  },
  pane = {
    util.map_key("UpArrow", act.ActivatePaneDirection("Up")),
    util.map_key("DownArrow", act.ActivatePaneDirection("Down")),
    util.map_key("LeftArrow", act.ActivatePaneDirection("Left")),
    util.map_key("RightArrow", act.ActivatePaneDirection("Right")),
    util.map_key({ "CTRL", "LeftArrow" }, act.AdjustPaneSize { "Left", 1 }),
    util.map_key({ "CTRL", "RightArrow" }, act.AdjustPaneSize { "Right", 1 }),
    util.map_key({ "CTRL", "UpArrow" }, act.AdjustPaneSize { "Up", 1 }),
    util.map_key({ "CTRL", "DownArrow" }, act.AdjustPaneSize { "Down", 1 }),
    util.map_key("Delete", act.CloseCurrentPane { confirm = true } ),
    util.map_key("r", act.RotatePanes("Clockwise")),
    util.map_key({ "SHIFT", "R" }, act.RotatePanes("CounterClockwise")),
    util.map_key("s", act.PaneSelect { mode = "SwapWithActive", alphabet = "123456789" }),
    util.map_key("z", act.TogglePaneZoomState),
    util.map_key("Escape", act.PopKeyTable)
  },
  copy_mode = {
    util.map_key("UpArrow", act.CopyMode("MoveUp")),
    util.map_key("DownArrow", act.CopyMode("MoveDown")),
    util.map_key("LeftArrow", act.CopyMode("MoveLeft")),
    util.map_key("RightArrow", act.CopyMode("MoveRight")),
    util.map_key({ "ALT", "UpArrow" }, act.CopyMode("MoveToViewportTop")),
    util.map_key({ "ALT", "DownArrow" }, act.CopyMode("MoveToViewportBottom")),
    util.map_key({ "ALT", "LeftArrow" }, act.CopyMode("MoveBackwardWord")),
    util.map_key({ "ALT", "RightArrow" }, act.CopyMode("MoveForwardWord")),
    util.map_key("Tab", act.CopyMode("MoveForwardWord")),
    util.map_key({ "SHIFT", "Tab" }, act.CopyMode("MoveBackwardWord")),
    util.map_key("Home", act.CopyMode("MoveToStartOfLineContent")),
    util.map_key("End", act.CopyMode("MoveToEndOfLineContent")),
    util.map_key("PageUp", act.CopyMode("PageUp")),
    util.map_key("PageDown", act.CopyMode("PageDown")),
    util.map_key("g", act.CopyMode("MoveToScrollbackTop")),
    util.map_key({ "SHIFT", "G" }, act.CopyMode("MoveToScrollbackBottom")),
    util.map_key("v", act.CopyMode { SetSelectionMode = "Cell" }),
    util.map_key({ "SHIFT", "V" }, act.CopyMode { SetSelectionMode = "Line" }),
    util.map_key("y", act.Multiple {
      act.CopyTo("ClipboardAndPrimarySelection"),
      act.CopyMode("Close")
    }),
    util.map_key("Escape", act.Multiple {
      act.ClearSelection,
      act.CopyMode("ClearPattern"),
      act.CopyMode("Close")
    })
  },
  search_mode = {
    util.map_key("UpArrow", act.CopyMode("PriorMatch")),
    util.map_key("DownArrow", act.CopyMode("NextMatch")),
    util.map_key("Delete", act.CopyMode("ClearPattern")),
    util.map_key("PageUp", act.CopyMode("PageUp")),
    util.map_key("PageDown", act.CopyMode("PageDown")),
    util.map_key({ "CTRL", "Space" }, act.CopyMode("CycleMatchType")),
    util.map_key("v", act.CopyMode {SetSelectionMode = "Cell"}),
    util.map_key({ "SHIFT", "V" }, act.CopyMode { SetSelectionMode = "Line" }),
    util.map_key("Escape", act.CopyMode("Close"))
  }
}
