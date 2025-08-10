require("nvchad.configs.lspconfig").defaults()

require("lspconfig").jdtls.setup {
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "Corretto-17",
            path = "/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home",
            default = true,
          },
        },
      },
    },
  },
}

require("lspconfig").clangd.setup {}
