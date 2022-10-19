local wez = require("wezterm")
local act = wez.action

local M = {}

function M.ensure_table(obj)
  return type(obj) == "table" and obj or { obj }
end

function M.merge_lists(t1, t2)
	local result = {}
	for _, v in pairs(t1) do
		table.insert(result, v)
	end
	for _, v in pairs(t2) do
		table.insert(result, v)
	end
	return result
end

function M.merge_tables(t1, t2)
	for k, v in pairs(t2) do
		if (type(v) == "table") and (type(t1[k] or false) == "table") then
			M.merge_tables(t1[k], t2[k])
		else
			t1[k] = v
		end
	end
	return t1
end

function M.flatten_table(table)
  local result = {}
  for _, v in pairs(table) do
    result = M.merge_tables(result, v)
  end
  return result
end

function M.flatten_list(list)
  local result = {}
  for _, v in pairs(list) do
    result = M.merge_lists(result, v)
  end
  return result
end

function M.split_keys(keys)
  local mods
  local name
  keys = M.ensure_table(keys)
  for i, v in ipairs(keys) do
    name = v
    if i ~= #keys then
      mods = i == 1 and name or mods .. "|" .. name
    end
  end
  return mods, name
end

function M.maybe_copy(window, pane)
  local has_selection = window:get_selection_text_for_pane(pane) ~= ""
  if has_selection then
    window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
    window:perform_action(act.ClearSelection, pane)
  else
    window:perform_action(act.ScrollToBottom, pane)
    window:perform_action(act.SendKey { mods = "CTRL", key = "c" }, pane)
  end
end

function M.activate_mode(name, oneshot, timeout)
  local table = { name = name }
  if timeout then
    timeout = timeout * 1000
  end
  table = M.merge_tables(table, { one_shot = oneshot or false, timeout_milliseconds = timeout })
  return act.ActivateKeyTable(table)
end

function M.map_key(keys, action)
  local mods, key = M.split_keys(keys)
  return { mods = mods, key = key, action = action }
end

function M.map_leader(keys, timeout)
  local mods, key = M.split_keys(keys)
  if timeout then
    timeout = timeout * 1000
  end
  return { mods = mods, key = key, timeout = timeout }
end

function M.notify(window, title, text, timeout)
  window:toast_notification(title, text, nil, timeout)
end

function M.split_cmds(cmds, count)
  local default_command = { "bash", "-l" }
  local split = {}
  if cmds == {} then
    table.insert(split, default_command)
  end
  for i = 1, count do
    if cmds and cmds[i] then
      split[i] = wez.shell_split(cmds[i])
    else
      split[i] = default_command
    end
  end
  return split
end

return M
