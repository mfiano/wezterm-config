local wez = require("wezterm")
local color = require("options").colors
local util = require("lib/util")

local M = {}

local formatters = {
  bg = function(x) return { Background = { Color = x } } end,
  fg = function(x) return { Foreground = { Color = x } } end,
  text = function(x) return { Text = x or "" } end,
  bold = function(x) return { Attribute = { Intensity = x and "Bold" or "Normal" } } end,
  italic = function(x) return { Attribute = { Italic = x or false } } end,
  underline = function(x) return { Attribute = { Underline = x and "Single" or "None" } } end
}

local function make_text(attrs)
  local text = {}
  for _, attr in pairs { "bold", "italic", "underline" } do
    local flag = attrs[attr]
    if flag then
      table.insert(text, formatters[attr](true))
    end
  end
  for _, attr in pairs { "bg", "fg" } do
    local col = attrs[attr]
    if col then
      table.insert(text, formatters[attr](col))
    end
  end
  table.insert(text, formatters.text(attrs.text))
  return text
end

function M.format_text(text_items)
  local text = util.flatten_list(text_items)
  return wez.format(text)
end

function M.mode_text(window)
  local mode = window:active_key_table()
  local text = {}
  if mode then
    text = {
      make_text {
        text = " mode ",
        fg = color.mode_label_fg,
        bg = color.mode_label_bg,
        bold = true
      },
      make_text { text = " " .. mode .. " ", fg = color.mode_fg, bg = color.mode_bg, bold = true }
    }
  end
  return M.format_text(text)
end

local function domain_text(pane)
  local domain = " " .. pane.domain_name .. ":"
  return make_text { text = domain, fg = color.domain_fg, bg = color.domain_bg, bold = true }
end

function M.tab_text(tab)
  local active = tab.is_active
  local pane = tab.active_pane
  local title_text
  local title = pane.title .. " "
  local text = { domain_text(pane) }
  if active then
    title_text = { text = title, fg = color.tab_active_fg, bg = color.tab_active_bg }
  else
    title_text = { text = title, fg = color.tab_inactive_fg, bg = color.tab_inactive_bg }
  end
  table.insert(text, make_text(title_text))
  return M.format_text(text)
end

function M.workspace_text(window)
  local text = " " .. window:active_workspace() .. " "
  return M.format_text {
    make_text { text = text, fg = color.workspace_fg, bg = color.workspace_bg, bold = true }
  }
end

return M
