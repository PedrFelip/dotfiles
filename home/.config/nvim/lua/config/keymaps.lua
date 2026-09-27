local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Limpar destaque da busca" })
map("i", "jj", "<Esc>", { desc = "Sair do modo Insert" })
map({ "n", "i" }, "<C-s>", "<cmd>write<CR>", { desc = "Salvar arquivo" })

map("n", "<C-h>", "<C-w>h", { desc = "Janela à esquerda" })
map("n", "<C-j>", "<C-w>j", { desc = "Janela abaixo" })
map("n", "<C-k>", "<C-w>k", { desc = "Janela acima" })
map("n", "<C-l>", "<C-w>l", { desc = "Janela à direita" })

map("n", "<leader>ud", function()
  if Snacks.dim.enabled then
    Snacks.dim.disable()
  else
    Snacks.dim.enable()
  end
end, { desc = "Alternar Dim" })
map("n", "tt", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Alternar terminal inferior" })
map("n", "tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Alternar terminal flutuante" })
map("n", "<leader>q", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Alternar diagnósticos" })
map("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Buscar arquivos" })
map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "Buscar texto no projeto" })
map("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = "Buscar buffers" })

local M = {}

function M.on_lsp_attach(event)
  local opts = { buffer = event.buf, silent = true }

  map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Ir para definição" }))
  map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Ir para declaração" }))
  map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Buscar referências" }))
  map("n", "gI", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Ir para implementação" }))
  map("n", "<leader>D", vim.lsp.buf.type_definition,
    vim.tbl_extend("force", opts, { desc = "Ir para definição do tipo" }))
  map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Mostrar documentação" }))
  map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Renomear símbolo" }))
  map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Ação de código" }))
  map("n", "<leader>f", function()
    vim.lsp.buf.format({ bufnr = event.buf })
  end, vim.tbl_extend("force", opts, { desc = "Formatar arquivo" }))
  map("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Mostrar diagnóstico" }))
  map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Diagnóstico anterior" }))
  map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Próximo diagnóstico" }))
end

return M
