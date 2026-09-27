return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "gofumpt", "goimports", "golangci-lint", "prettier" },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig", "saghen/blink.cmp" },
    opts = {
      ensure_installed = { "lua_ls", "gopls", "ts_ls", "eslint" },
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup(opts)
      require("config.lsp").setup()
    end,
  },
}
