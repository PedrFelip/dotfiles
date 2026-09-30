local group = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  once = true,
  callback = function()
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      local directory_buffer = vim.api.nvim_get_current_buf()
      vim.api.nvim_set_current_dir(vim.fn.argv(0))
      vim.cmd("enew")
      vim.api.nvim_buf_delete(directory_buffer, {})
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })
  end,
})
