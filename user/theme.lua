local M = {}

local colors = {
  black = "#1f1f1f",
  red = "#e06c75",
  green = "#98c379",
  yellow = "#d19a66",
  blue = "#61afef",
  magenta = "#c678dd",
  cyan = "#56b6c2",
  white1 = "#ffffff",
  white2 = "#eeeeee",
  white3 = "#abb2bf",
  grey1 = "#262626",
  grey2 = "#666666",
  grey3 = "#5c6379",
}

local fmt = {}

function fmt.bg(color) return { Background = { Color = color } } end
function fmt.fg(color) return { Foreground = { Color = color } } end
function fmt.text(text) return { Text = text or "" } end
function fmt.bold(enabled) return { Intensity = enabled and "Bold" or "Normal" } end
function fmt.italic(enabled) return { Italic = enabled or false } end
function fmt.underline(enabled) return { Underline = enabled and "Single" or "None" } end
function fmt.attr(name, flag) return { Attribute = fmt[name](flag) } end

function M.text_item(attrs)
  local text = {}
  for _, attr in pairs { "bold", "italic", "underline" } do
    local flag = attrs[attr]
    if flag then
      table.insert(text, fmt.attr(attr, true))
    end
  end
  for _, attr in pairs { "bg", "fg" } do
    local color_name = attrs[attr]
    if color_name then
      local color = colors[color_name]
      table.insert(text, fmt[attr](color))
    end
  end
  table.insert(text, fmt.text(attrs.text))
  return text
end

M.config = {
  color_scheme = "OneHalfDark",
  colors = {
    background = colors.grey1,
    cursor_bg = colors.blue,
    cursor_fg = colors.black,
    ansi = {
      colors.black,
      colors.red,
      colors.green,
      colors.yellow,
      colors.blue,
      colors.magenta,
      colors.cyan,
      colors.white3
    },
    brights = {
      colors.grey3,
      colors.red,
      colors.green,
      colors.yellow,
      colors.blue,
      colors.magenta,
      colors.cyan,
      colors.white1
    }
  }
}

return M
