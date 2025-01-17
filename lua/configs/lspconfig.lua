require("java").setup()

require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"
local servers = { "clangd", "pylsp", "ts_ls", "jdtls" }
local nvlsp = require "nvchad.configs.lspconfig"
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
