local wez = require("wezterm")
local opt = require("options")

local M = {}

M.config = {
  allow_win32_input_mode = false,
  audible_bell = "Disabled",
  automatically_reload_config = true,
  check_for_updates = false,
  default_gui_startup_args = { "connect", wez.hostname() },
  default_workspace = "shell",
  enable_wayland = false,
  freetype_interpreter_version = 40,
  freetype_load_target = "Normal",
  selection_word_boundary = " \t\n{}[]()\"'`,;:@│*",
  ssh_domains = opt.remote_muxers,
  term = "wezterm",
  unicode_version = 14,
  unix_domains = { { name = wez.hostname() } },
  unzoom_on_switch_pane = true,
  use_ime = false
}

return M
