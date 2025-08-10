return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "nvim-java/nvim-java",
    config = function()
      require "configs.nvim-java"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
    dependencies = {
      "nvim-java/nvim-java",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "bash",
        "regex",
        "c",
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require "configs.noice"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = "BufWritePre",
    config = function()
      require "configs.nvim-lint"
    end,
  },
}
