local dap = require "dap"

dap.adapters.codelldb = {
  type = "server",
  host = "127.0.0.1",
  port = 13000,
}

dap.adapters.python = function(cb, config)
  if config.request == "attach" then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or "127.0.0.1"
    cb {
      type = "server",
      port = assert(port, "`connect.port` is required for a python `attach` configuration"),
      host = host,
      options = {
        source_filetype = "python",
      },
    }
  else
    cb {
      type = "executable",
      command = "path/to/virtualenvs/debugpy/bin/python",
      args = { "-m", "debugpy.adapter" },
      options = {
        source_filetype = "python",
      },
    }
  end
end

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = {
    os.getenv "HOME" .. "/Users/kushpadalia/.local/share/nvim/mason/packages/chrome-debug-adapter/chrome-debug-adapter",
  },
}
dap.configurations.typescriptreact = { -- change to typescript if needed
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}",
  },
}
