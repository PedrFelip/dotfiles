return {
  "mason-org/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp",
  },
  opts = {
    ensure_installed = { "lua_ls", "gopls", "ts_ls", "eslint" },
  },
  config = function(_, opts)
    require("mason-lspconfig").setup(opts)
    require("config.lsp").setup()
  end,
}
