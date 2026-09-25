local M = {}

local parsers = {
  "bash",
  "go",
  "gomod",
  "gosum",
  "gowork",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
}

local filetypes = {
  "bash",
  "go",
  "gomod",
  "gosum",
  "gowork",
  "javascript",
  "json",
  "lua",
  "markdown",
  "typescript",
  "typescriptreact",
  "vim",
  "vimdoc",
}

function M.setup()
  require("nvim-treesitter").setup({})
  require("nvim-treesitter").install(parsers)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function(event)
      local filetype = vim.bo[event.buf].filetype
      if vim.treesitter.language.add(filetype) then
        vim.treesitter.start(event.buf)
      end
    end,
  })
end

return M
