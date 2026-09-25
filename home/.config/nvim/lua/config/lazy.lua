local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error("Falha ao clonar lazy.nvim:\n" .. result)
  end
end

vim.opt.rtp:prepend(lazypath)

local theme_file = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")
local theme_plugins = {}
local omarchy_colorscheme
if vim.fn.filereadable(theme_file) == 1 then
  local ok, specs = pcall(dofile, theme_file)
  if ok and type(specs) == "table" then
    for _, spec in ipairs(specs) do
      if type(spec) == "table" then
        if spec[1] == "LazyVim/LazyVim" then
          omarchy_colorscheme = spec.opts and spec.opts.colorscheme
        elseif type(spec[1]) == "string" then
          theme_plugins[#theme_plugins + 1] = spec
        end
      end
    end
  end
end

vim.g.omarchy_colorscheme = omarchy_colorscheme

require("lazy").setup({
  spec = {
    { import = "plugins" },
    unpack(theme_plugins),
  },
  install = { colorscheme = { "tokyonight-night", "habamax" } },
})
