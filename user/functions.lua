local wez = require("wezterm")
local act = wez.action

local M = {}

local function merge_tables(t1, t2)
	for k, v in pairs(t2) do
		if (type(v) == "table") and (type(t1[k] or false) == "table") then
			merge_tables(t1[k], t2[k])
		else
			t1[k] = v
		end
	end
	return t1
end

local function merge_lists(t1, t2)
	local result = {}
	for _, v in pairs(t1) do
		table.insert(result, v)
	end
	for _, v in pairs(t2) do
		table.insert(result, v)
	end
	return result
end

local function split_keys(keys)
  local mods
  local name
  keys = type(keys) == "table" and keys or { keys }
  for i, v in ipairs(keys) do
    name = v
    if i ~= #keys then
      mods = i == 1 and name or mods .. "|" .. name
    end
  end
  return mods, name
end

function M.flatten_table(table)
  local result = {}
  for _, v in pairs(table) do
    result = merge_tables(result, v)
  end
  return result
end

function M.flatten_list(list)
  local result = {}
  for _, v in pairs(list) do
    result = merge_lists(result, v)
  end
  return result
end

function M.maybe_copy(window, pane)
  local has_selection = window:get_selection_text_for_pane(pane) ~= ""
  if has_selection then
    window:perform_action(act.CopyTo "ClipboardAndPrimarySelection", pane)
    window:perform_action(act.ClearSelection, pane)
  else
    window:perform_action(act.SendKey { mods = "CTRL", key = "c" }, pane)
  end
end

function M.activate_key_table(name, timeout)
  local table = { name = name }
  if timeout then
    table = merge_tables(table, { one_shot = false, timeout_milliseconds = timeout })
  end
  return act.ActivateKeyTable(table)
end

function M.format_text(text_items)
  local text = M.flatten_list(text_items)
  return wez.format(text)
end

function M.map_key(keys, action)
  local mods, name = split_keys(keys)
  return { mods = mods, key = name, action = action }
end

return M
