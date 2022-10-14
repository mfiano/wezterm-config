local util = require("lib/util")

return util.flatten_table {
  require("cfg/core").config,
  require("cfg/ui").config,
  require("cfg/keys").config,
  require("cfg/mouse").config,
  require("cfg/events").config
}
