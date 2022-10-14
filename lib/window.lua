local mux = require("wezterm").mux
local util = require("lib/util")

local M = {}

local layouts = {}

local function ensure_tab(workspace, window, cmd)
  local new_window, pane
  if window then
    _, pane = window:spawn_tab { args = cmd }
  else
    _, pane, new_window = mux.spawn_window { workspace = workspace, args = cmd }
  end
  return pane, new_window or window
end

function layouts.full(workspace, window, cmds)
  cmds = util.split_cmds(cmds, 1)
  local _, _window = ensure_tab(workspace, window, cmds[1])
  return _window
end

function layouts.quad(workspace, window, cmds)
  local cmd1, cmd2, cmd3, cmd4 = table.unpack(util.split_cmds(cmds, 4))
  local bottom, _window = ensure_tab(workspace, window, cmd4)
  local top = bottom:split { direction = "Top", args = cmd3 }
  bottom:split { direction = "Left", args = cmd2 }
  top:split { direction = "Left", args = cmd1 }
  return _window
end

function layouts.horizontal(workspace, window, cmds)
  local cmd1, cmd2 = table.unpack(util.split_cmds(cmds, 2))
  local bottom, _window = ensure_tab(workspace, window, cmd2)
  bottom:split { direction = "Top", args = cmd1 }
  return _window
end

function layouts.vertical(workspace, window, cmds)
  local cmd1, cmd2 = table.unpack(util.split_cmds(cmds, 2))
  local right, _window = ensure_tab(workspace, window, cmd2)
  right:split { direction = "Left", args = cmd1 }
  return _window
end

local function make_tab(workspace, layout, window, cmds)
  return layouts[layout](workspace, window, util.ensure_table(cmds))
end

local function make_window(workspace, layout, cmds)
  return make_tab(workspace, layout, nil, cmds)
end

function M.make_workspaces(workspaces)
  for workspace, tabs in pairs(workspaces) do
    local window
    for i, pane in ipairs(tabs) do
      local layout = pane.layout or "full"
      local cmds = pane.commands
      if i == 1 then
        window = make_window(workspace, layout, cmds)
      else
        make_tab(workspace, layout, window, cmds)
      end
    end
  end
end

return M
