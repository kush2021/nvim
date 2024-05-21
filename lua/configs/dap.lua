local dap = require "dap"

-- C++
dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "~/.local/share/nvim/mason/bin/OpenDebugAD7",
}

-- TypeScript
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = { "~/.local/share/nvim/mason/bin/js-debug-adapter/src/dapDebugServer.ts" },
  },
}
dap.configurations.typescript = {
  type = "pwa-node",
  request = "launch",
  name = "Launch file",
  program = "${file}",
  cwd = "${workspaceFolder}",
}
