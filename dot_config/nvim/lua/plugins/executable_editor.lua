local Util = require("lazyvim.util")

-- local function biome_lsp_or_prettier(bufnr)
--   local has_biome_lsp = vim.lsp.get_active_clients({
--     bufnr = bufnr,
--     name = "biome",
--   })[1]
--   if has_biome_lsp then
--     return {}
--   end
--   local has_prettier = vim.fs.find({
--     -- https://prettier.io/docs/en/configuration.html
--     ".prettierrc",
--     ".prettierrc.json",
--     ".prettierrc.yml",
--     ".prettierrc.yaml",
--     ".prettierrc.json5",
--     ".prettierrc.js",
--     ".prettierrc.cjs",
--     ".prettierrc.toml",
--     "prettier.config.js",
--     "prettier.config.cjs",
--   }, { upward = true })[1]
--   if has_prettier then
--     return { "prettier" }
--   end
--   return { "biome" }
-- end

return {
  -- Neotree -----------------------------------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>nt",
        function()
          require("neo-tree.command").execute({ toggle = false, dir = require("lazyvim.util").root.get() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>pv",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
  -- Telescope ---------------------------------------------------------------
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   keys = {
  --     { "<leader>ff", LazyVim.pick("auto"), desc = "Find Files (Root Dir)" },
  --     { "<leader>fF", LazyVim.pick("auto", { root = false }), desc = "Find Files (cwd)" },
  --     { "<leader>fb", false },
  --   },
  --   opts = function()
  --     local actions = require("telescope.actions")
  --
  --     local open_with_trouble = function(...)
  --       return require("trouble.providers.telescope").open_with_trouble(...)
  --     end
  --     local open_selected_with_trouble = function(...)
  --       return require("trouble.providers.telescope").open_selected_with_trouble(...)
  --     end
  --     local find_files_no_ignore = function()
  --       local action_state = require("telescope.actions.state")
  --       local line = action_state.get_current_line()
  --       Util.telescope("find_files", { no_ignore = true, default_text = line })()
  --     end
  --     local find_files_with_hidden = function()
  --       local action_state = require("telescope.actions.state")
  --       local line = action_state.get_current_line()
  --       Util.telescope("find_files", { hidden = true, default_text = line })()
  --     end
  --
  --     return {
  --       defaults = {
  --         -- vimgrep_arguments = {
  --         --   "rg",
  --         --   "-L",
  --         --   "--color=never",
  --         --   "--no-heading",
  --         --   "--with-filename",
  --         --   "--line-number",
  --         --   "--column",
  --         --   "--smart-case",
  --         -- },
  --         prompt_prefix = "   ",
  --         prompt_title = "",
  --         results_title = "",
  --         preview_title = "",
  --         selection_caret = "  ",
  --         entry_prefix = "  ",
  --         initial_mode = "insert",
  --         selection_strategy = "reset",
  --         sorting_strategy = "ascending",
  --         layout_strategy = "horizontal",
  --         layout_config = {
  --           horizontal = {
  --             prompt_position = "top",
  --             -- preview_width = 0.55,
  --             -- results_width = 0.8,
  --           },
  --           vertical = {
  --             mirror = false,
  --           },
  --           width = 0.9,
  --           height = 0.80,
  --           preview_cutoff = 120,
  --         },
  --         path_display = { "truncate" },
  --         winblend = 0,
  --         borderchars = {
  --           { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
  --           prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
  --           results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
  --           preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
  --         },
  --         mappings = {
  --           i = {
  --             ["<c-t>"] = open_with_trouble,
  --             ["<a-t>"] = open_selected_with_trouble,
  --             ["<a-i>"] = find_files_no_ignore,
  --             ["<a-h>"] = find_files_with_hidden,
  --             ["<C-Down>"] = actions.cycle_history_next,
  --             ["<C-Up>"] = actions.cycle_history_prev,
  --             ["<C-f>"] = actions.preview_scrolling_down,
  --             ["<C-b>"] = actions.preview_scrolling_up,
  --           },
  --           n = {
  --             ["q"] = actions.close,
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
  -- LSP ---------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
        show_type_hints = true,
        show_parameter_hints = true,
        show_other_hints = false,
      },
      servers = {
        ts_ls = {
          init_options = {
            preferences = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
              importModuleSpecifierPreference = "non-relative",
            },
          },
        },
      },
    },
  },
  -- Mason -------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
      },
    },
  },
  -- Supermaven --------------------------------------------------------------
  {
    "supermaven-inc/supermaven-nvim",
    -- build = ":SupermavenUseFree", -- remove this line if you are using pro
    config = function()
      require("supermaven-nvim").setup({})
    end,
    opts = {},
  },
  -- LuaSnip -----------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    keys = {
      { "<tab>", false, mode = { "i", "s" } },
      { "<s-tab>", false, mode = { "i", "s" } },
    },
  },
  -- Cmp ---------------------------------------------------------------------
  --   {
  --     "nvim-cmp",
  --     keys = {
  --       { "<tab>", false, mode = { "i", "s" } },
  --       { "<s-tab>", false, mode = { "i", "s" } },
  --     },
  --     ---@param opts cmp.ConfigSchema
  --     opts = function(_, opts)
  --       table.insert(opts.sources, 1, {
  --         name = "supermaven",
  --         group_index = 1,
  --         priority = 100,
  --       })
  --     end,
  --   },
}
