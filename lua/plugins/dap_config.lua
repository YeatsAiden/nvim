local status_ok, mason_registry = pcall(require, "mason-registry")
if not status_ok then
  return
end

local install_packages = {
    "debugpy", -- Python
    "codelldb", -- Rust
}

local packages_installed = mason_registry.get_installed_package_names()

function install_dap(installed_packages, packages_to_install)
  for _, i in pairs(packages_to_install) do
    local install = true
    for _, j in pairs(installed_packages) do
      if i == j then
        install = false
        break
      end
    end
    if install then
      vim.cmd("MasonInstall " .. i)
    end
  end
end

install_dap(packages_installed, install_packages)

local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
  return
end

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"

local status_ok, dap_python = pcall(require, "dap-python")
if not status_ok then
  return
end

dap_python.setup(path)
