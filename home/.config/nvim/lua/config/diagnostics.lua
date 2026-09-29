vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    source = "if_many",
    prefix = "●",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  },
})
