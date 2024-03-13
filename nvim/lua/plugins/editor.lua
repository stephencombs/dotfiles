local Util = require("lazyvim.util")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>n",
        function()
          require("neo-tree.command").execute({ toggle = false, dir = require("lazyvim.util").get_root() })
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
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<C-b>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<C-f>", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<C-F>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      -- { "<C-o>", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- { "<C-O>", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
      { "<leader>fb", false },
      { "<leader>ff", false },
      { "<leader>fF", false },
      -- { "<leader>fr", false },
      -- { "<leader>fR", false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        tsserver = {
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
        quick_lint_js = {},
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      { "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon - Quick Menu" },
      { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Harpoon - Add File" },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
  },
}
