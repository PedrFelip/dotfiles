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

local function rg_exclude_args()
  local args = {}
  for _, directory in ipairs(ignored_directories) do
    table.insert(args, "-g")
    table.insert(args, "!**/" .. directory .. "/**")
  end
  return args
end

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    defaults = {
      color_devicons = true,
      vimgrep_arguments = (function()
        local args = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--no-ignore",
        }
        vim.list_extend(args, rg_exclude_args())
        return args
      end)(),
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
          preview_width = 0.5,
        },
        width = 0.85,
        height = 0.8,
      },
      mappings = {
        i = {
          ["<C-j>"] = function(...)
            require("telescope.actions").move_selection_next(...)
          end,
          ["<C-k>"] = function(...)
            require("telescope.actions").move_selection_previous(...)
          end,
        },
        n = {
          ["<C-j>"] = function(...)
            require("telescope.actions").move_selection_next(...)
          end,
          ["<C-k>"] = function(...)
            require("telescope.actions").move_selection_previous(...)
          end,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
    pickers = {
      find_files = {
        theme = "ivy",
        layout_config = {
          height = 10,
        },
        find_command = (function()
          local args = { "rg", "--files", "--hidden", "--no-ignore" }
          vim.list_extend(args, rg_exclude_args())
          return args
        end)(),
        previewer = false,
        prompt_title = false,
        results_title = false,
      },
      buffers = {
        theme = "ivy",
        layout_config = {
          height = 12,
        },
        previewer = false,
        results_title = false,
        prompt_title = false,
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")
  end,
}
