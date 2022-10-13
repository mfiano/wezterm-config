local fn = require("user/functions")
require("user/hooks")

local core = {
  audible_bell = "Disabled",
  check_for_updates = false,
  default_gui_startup_args = { "connect", "main" },
  enable_wayland = false,
  freetype_interpreter_version = 40,
  freetype_load_target = "Light",
  freetype_render_target = "HorizontalLcd",
  term = "wezterm",
  unicode_version = 14,
}

local config = {
  core,
  require("user/theme").config,
  require("user/ui").config,
  require("user/domain").config,
  require("user/keys").config
}

return fn.flatten_table(config)
