local tokyonightConfig = {
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelscopePreviewBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelscopeResultsBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
}

local draculaConfig = {
  -- use transparent background
  -- transparent_bg = true, -- default false
  -- set italic comment
  italic_comment = true, -- default false
  -- overrides the default highlights with table see `:h synIDattr`
  overrides = function(colors)
    return {
      TelescopeNormal = { bg = colors.bg, fg = colors.fg },
      TelescopeBorder = { bg = colors.bg, fg = colors.fg },
      TelescopePromptNormal = {
        bg = "#2d3149",
      },
      TelescopePromptBorder = {
        bg = "#2d3149",
        fg = "#2d3149",
      },
      TelescopePromptTitle = {
        fg = "#2d3149",
        bg = "#2d3149",
      },
      TelescopePreviewTitle = { bg = colors.bg, fg = colors.bg },
      TelescopePreviewBorder = { bg = colors.bg, fg = colors.bg },
      TelescopeResultsTitle = { bg = colors.bg, fg = colors.bg },
      TelescopeResultsBorder = { bg = colors.bg, fg = colors.bg },
    }
  end,
  -- You can use overrides as table like this
  -- overrides = {
  --   NonText = { fg = "white" }, -- set NonText fg to white
  --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
  --   Nothing = {} -- clear highlight of Nothing
  -- },
  -- Or you can also use it like a function to get color from theme
  -- overrides = function (colors)
  --   return {
  --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
  --   }
  -- end,
}

return {
  -- add rose-pine
  { "rose-pine/neovim", name = "rose-pine" },

  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- add catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },

  -- add tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup(tokyonightConfig)
    end,
  },

  -- add dracula
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup(draculaConfig)
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
      -- colorscheme = "tokyonight-storm",
    },
  },
}
