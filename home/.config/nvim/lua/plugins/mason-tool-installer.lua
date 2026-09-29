return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
  dependencies = { "mason-org/mason.nvim" },
  opts = {
    ensure_installed = { "gofumpt", "goimports", "golangci-lint", "prettier" },
  },
}
