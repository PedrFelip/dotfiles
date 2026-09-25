return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    auto_close = true,
    auto_preview = true,
    focus = true,
    multiline = true,
    warn_no_results = false,
    open_no_results = true,
    win = { position = "bottom", size = 10 },
    icons = {
      error = "󰅚",
      warning = "󰀪",
      hint = "󰌶",
      information = "󰋽",
      other = "󰠠",
    },
  },
}
