return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "horizontal",
      size = 15,
      on_open = function(term)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { buffer = term.bufnr, desc = "Janela à esquerda" })
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { buffer = term.bufnr, desc = "Janela abaixo" })
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { buffer = term.bufnr, desc = "Janela acima" })
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { buffer = term.bufnr, desc = "Janela à direita" })
      end,
    },
  },
}
