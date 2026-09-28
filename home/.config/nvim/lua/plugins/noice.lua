return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        cmdline = { icon = ":" },
      },
    },
    popupmenu = {
      enabled = true,
      backend = "nui",
    },
    messages = { enabled = true },
    notify = {
      enabled = true,
      view = "notify",
    },
    views = {
      cmdline_popup = {
        position = { row = -1, col = 0 },
        size = { width = "100%", height = "auto" },
        border = { style = "none", padding = { 0, 1 } },
      },
    },
  },
}
