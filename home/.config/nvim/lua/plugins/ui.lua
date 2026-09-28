local ignored_directories = {
  ".git",
  "node_modules",
  "vendor",
  "dist",
  "build",
  ".cache",
  ".venv",
  "venv",
  "__pycache__",
  ".pytest_cache",
  ".mypy_cache",
  ".ruff_cache",
  "coverage",
  ".next",
  ".nuxt",
  ".turbo",
}

local explorer_root = vim.fs.normalize(vim.fn.getcwd())

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        function()
          vim.cmd("Neotree toggle dir=" .. vim.fn.fnameescape(explorer_root))
        end,
        desc = "Abrir explorador de arquivos",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      window = { position = "right", width = 32 },
      filesystem = {
        commands = {
          navigate_up = function(state)
            if vim.fs.normalize(state.path) ~= explorer_root then
              require("neo-tree.sources.filesystem.commands").navigate_up(state)
            end
          end,
        },
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = ignored_directories,
          never_show_by_pattern = {
            vim.fn.stdpath("config") .. "/lua/plugins/theme.lua",
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        component_separators = "",
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { delay = 1000 },
    config = function(_, opts)
      require("which-key").setup({
        delay = opts.delay,
      })
    end,
  },
}
