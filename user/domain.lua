local M = {}

local function register_ssh_domain(name, address, port)
  return {
    name = name,
    remote_address = port and address .. ":" .. port or address,
    ssh_option = { wezterm_ssh_verbose = "true" }
  }
end

M.config = {
  ssh_domains = {
    register_ssh_domain("vps", "vps")
  },
  unix_domains = { { name = "main" } }
}

return M
