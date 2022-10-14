local act = require("wezterm").action

local M = {}

local bindings = {
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = "CTRL",
    action = act.IncreaseFontSize,
  },
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = "CTRL",
    action = act.DecreaseFontSize,
  },
  {
    event = { Down = { streak = 1, button = "Middle" } },
    mods = "CTRL",
    action = act.ResetFontSize,
  },
  {
    event = { Up = { streak = 1, button = "Left" } },
    action = act.CompleteSelection("PrimarySelection"),
  },
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = act.OpenLinkAtMouseCursor,
  },
  {
    event = { Down = { streak = 1, button = "Left" } },
    action = act.SelectTextAtMouseCursor("Cell"),
  },
  {
    event = { Down = { streak = 2, button = "Left" } },
    action = act.SelectTextAtMouseCursor("Word"),
  },
  {
    event = { Down = { streak = 1, button = "Left" } },
    mods = "SHIFT",
    action = act.ExtendSelectionToMouseCursor("Cell"),
  },
  {
    event = { Drag = { streak = 1, button = "Left" } },
    action = act.ExtendSelectionToMouseCursor("Cell"),
  },
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    action = act.ScrollByCurrentEventWheelDelta,
  },
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    action = act.ScrollByCurrentEventWheelDelta,
  }
}

M.config = {
  alternate_buffer_wheel_scroll_speed = 1,
  disable_default_mouse_bindings = true,
  mouse_bindings = bindings
}

return M
