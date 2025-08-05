vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

local lint = require "lint"

lint.linters.checkstyle = {
  cmd = vim.fn.stdpath "data" .. "/mason/bin/checkstyle",
  stdin = false,
  args = {
    "-c",
    "/Users/kush.padalia/Documents/workspace/vaultapp-regulatory/src/main/resources/checks-gradle/checkstyle.xml", -- your config file
    "-f",
    "xml",
  },
  stream = "stdout",
  ignore_exitcode = true,
  parser = function(output, bufnr)
    local diagnostics = {}
    for file, line, column, message, severity in
      string.gmatch(output, [[file name="(.-)".-line="(%d+)".-column="(%d+)".-severity="(.-)".-message="(.-)"]])
    do
      table.insert(diagnostics, {
        lnum = tonumber(line) - 1,
        col = tonumber(column) - 1,
        message = message,
        severity = vim.diagnostic.severity.WARN,
        source = "checkstyle",
      })
    end
    return diagnostics
  end,
}

lint.linters_by_ft = {
  java = { "checkstyle" },
}
