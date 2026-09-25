return {
  {
    name = "omarchy-theme-hotreload",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    priority = 1000,
    config = function()
      local theme_name_file = vim.fn.expand("~/.local/state/omarchy/current/theme.name")
      local theme_config_file = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")
      local previous_theme

      local function apply_theme()
        if vim.fn.filereadable(theme_config_file) ~= 1 then
          return
        end

        local ok, theme_spec = pcall(dofile, theme_config_file)
        if not ok or type(theme_spec) ~= "table" then
          return
        end

        local plugin_name
        local colorscheme
        for _, spec in ipairs(theme_spec) do
          if type(spec) == "table" then
            if spec[1] == "LazyVim/LazyVim" then
              colorscheme = spec.opts and spec.opts.colorscheme
            elseif spec[1] and not plugin_name then
              plugin_name = spec.name or spec[1]
            end
          end
        end
        if not colorscheme then
          return
        end

        -- Omarchy theme files use a LazyVim spec to declare the colorscheme.
        -- Kickstart only needs the colorscheme name; it must not install LazyVim.
        vim.g.omarchy_colorscheme = colorscheme

        local plugin = plugin_name and require("lazy.core.config").plugins[plugin_name]
        if plugin and plugin._.loaded then
          require("lazy.core.loader").reload(plugin)
        elseif plugin then
          require("lazy.core.loader").colorscheme(colorscheme)
        end

        vim.schedule(function()
          vim.cmd("highlight clear")
          if vim.fn.exists("syntax_on") == 1 then
            vim.cmd("syntax reset")
          end
          vim.o.background = "dark"
          pcall(vim.cmd.colorscheme, colorscheme)
          vim.cmd("redraw!")
        end)
      end

      local function current_theme()
        if vim.fn.filereadable(theme_name_file) ~= 1 then
          return nil
        end
        return vim.fn.readfile(theme_name_file)[1]
      end

      apply_theme()
      previous_theme = current_theme()

      local timer = vim.uv.new_timer()
      local function check_theme()
        local theme = current_theme()
        if theme and theme ~= previous_theme then
          previous_theme = theme
          apply_theme()
        end
      end
      timer:start(5000, 5000, vim.schedule_wrap(check_theme))

      vim.api.nvim_create_autocmd("VimLeavePre", {
        once = true,
        callback = function()
          if not timer:is_closing() then
            timer:stop()
            timer:close()
          end
        end,
      })
    end,
  },
}
