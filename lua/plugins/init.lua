return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "markdownlint",
        "python-lsp-server",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "python",
      },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },
    ft = {
      "markdown",
    },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "configs.gitsigns"
    end,
  },

  {
    "tpope/vim-fugitive",
  },

  {
    "VonHeikemen/fine-cmdline.nvim",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
}
