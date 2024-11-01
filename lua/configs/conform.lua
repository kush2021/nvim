local conform = require "conform"
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    python = { "yapf" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
conform.setup(options)
