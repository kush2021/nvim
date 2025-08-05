require("java").setup()

function _G.run_gradle_test()
  local filepath = vim.fn.expand "%:p"
  local classname = vim.fn.expand "%:t:r"

  if vim.bo.filetype ~= "java" then
    vim.notify("Not a Java file.", vim.log.levels.WARN)
    return
  end

  local source_roots = { "src/test/java", "src/integrationTest/java", "src/main/java" }
  local package_path_with_slashes = nil

  for _, root in ipairs(source_roots) do
    local pattern = root .. "/(.-)/[^/]+%.java$"
    local match = filepath:match(pattern)
    if match then
      package_path_with_slashes = match
      break
    end
  end

  if not package_path_with_slashes then
    vim.notify("Could not determine package from path: " .. filepath, vim.log.levels.ERROR)
    return
  end

  local package_name = package_path_with_slashes:gsub("/", ".")
  local full_test_name = package_name .. "." .. classname

  local command_to_run = string.format("./gradlew test --tests %s", full_test_name)

  vim.cmd("split | term " .. command_to_run)
end

vim.keymap.set("n", "<leader>t", "<cmd>lua _G.run_gradle_test()<CR>", {
  noremap = true,
  silent = true,
  desc = "Run Gradle test for current Java file",
})
