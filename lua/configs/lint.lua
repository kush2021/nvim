local lint = require "lint"

lint.linters_by_ft = {
  cpp = { "cpplint" },
  typescript = { "eslint_d" },
  python = { "pylint" }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
