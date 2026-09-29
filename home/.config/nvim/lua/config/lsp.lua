-- nvim-lspconfig fornece as definições dos servidores; a ativação usa a API
-- nativa vim.lsp.config/vim.lsp.enable disponível no Neovim 0.11+.
local M = {}

local servers = { "lua_ls", "gopls", "ts_ls", "eslint" }

function M.setup()
  local capabilities = require("blink.cmp").get_lsp_capabilities()

  for _, server in ipairs(servers) do
    local server_config = { capabilities = capabilities }

    if server == "gopls" then
      server_config.settings = {
        gopls = {
          gofumpt = true,
          staticcheck = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
        },
      }
    end

    vim.lsp.config(server, server_config)
    vim.lsp.enable(server)
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = require("config.keymaps").on_lsp_attach,
  })

  local reference_group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
  vim.api.nvim_create_autocmd("CursorHold", {
    group = reference_group,
    callback = function(event)
      local clients = vim.lsp.get_clients({ bufnr = event.buf, method = "textDocument/documentHighlight" })
      if #clients > 0 then
        vim.lsp.buf.document_highlight()
      end
    end,
  })
  vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
    group = reference_group,
    callback = function(event)
      vim.lsp.buf.clear_references()
    end,
  })
end

return M
