vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
local lint_progress = function()
  local linters = require("lint").get_running()
  if #linters == 0 then
    return " "
  end
  return " " .. table.concat(linters, ", ")
end
lint_progress()
require("lint").linters_by_ft = {
  cpp = { "cpplint" },
  python = { "flake8" },
  typescript = { "prettier" },
}
