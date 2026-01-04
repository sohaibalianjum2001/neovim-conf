return {
  {
    "ydkulks/cursor-dark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cursor-dark").setup({
        transparent = false,
      })

      vim.cmd.colorscheme("cursor-dark")

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "cursor-dark",
        callback = function()
          ----------------------------------------------------------------------
          -- Base UI (soft black, NOT pitch black)
          ----------------------------------------------------------------------
          local bg = "#0c0c0c"

          vim.api.nvim_set_hl(0, "Normal", { bg = bg, fg = "#f0f0f0" })
          vim.api.nvim_set_hl(0, "NormalNC", { bg = bg })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg })
          vim.api.nvim_set_hl(0, "SignColumn", { bg = bg })
          vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#262626", bg = bg })
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#323232", bg = bg })

          ----------------------------------------------------------------------
          -- Cursor Dark Contrast++ palette (PERFECT ZONE)
          ----------------------------------------------------------------------
          local colors = {
            red = "#f29a9a",
            green = "#b9e28c",
            yellow = "#f4d37a",
            blue = "#9fcfff",
            purple = "#cfaeff",
            cyan = "#8fe6d9",
            fg = "#f0f0f0",
            gray = "#a8a8a8",
          }

          ----------------------------------------------------------------------
          -- Syntax
          ----------------------------------------------------------------------
          vim.api.nvim_set_hl(0, "String", { fg = colors.green })
          vim.api.nvim_set_hl(0, "@string", { fg = colors.green })

          vim.api.nvim_set_hl(0, "Function", { fg = colors.yellow })
          vim.api.nvim_set_hl(0, "@function", { fg = colors.yellow })

          vim.api.nvim_set_hl(0, "Keyword", { fg = colors.purple })
          vim.api.nvim_set_hl(0, "@keyword", { fg = colors.purple })

          vim.api.nvim_set_hl(0, "Type", { fg = colors.cyan })
          vim.api.nvim_set_hl(0, "@type", { fg = colors.cyan })
          vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.cyan })

          vim.api.nvim_set_hl(0, "Identifier", { fg = colors.red })
          vim.api.nvim_set_hl(0, "@property", { fg = colors.red })
          vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = colors.red })

          vim.api.nvim_set_hl(0, "Constant", { fg = colors.blue })
          vim.api.nvim_set_hl(0, "@constant", { fg = colors.blue })
          vim.api.nvim_set_hl(0, "Number", { fg = colors.blue })
          vim.api.nvim_set_hl(0, "Boolean", { fg = colors.blue })

          ----------------------------------------------------------------------
          -- UI polish
          ----------------------------------------------------------------------
          vim.api.nvim_set_hl(0, "LineNr", { fg = "#4a4a4a", bg = bg })
          vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.yellow, bold = true, bg = bg })
          vim.api.nvim_set_hl(0, "CursorLine", { bg = "#151515" })
          vim.api.nvim_set_hl(0, "VertSplit", { fg = "#2a2a2a", bg = bg })

          vim.api.nvim_set_hl(0, "Visual", { bg = "#1e1e1e" })
          vim.api.nvim_set_hl(0, "Search", { fg = "#000000", bg = colors.yellow })
          vim.api.nvim_set_hl(0, "IncSearch", { fg = "#000000", bg = colors.blue })

          ----------------------------------------------------------------------
          -- Diagnostics
          ----------------------------------------------------------------------
          vim.api.nvim_set_hl(0, "ErrorMsg", { fg = colors.red })
          vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
          vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.yellow })
          vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.blue })
          vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.cyan })

          vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = colors.red, undercurl = true })
          vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = colors.yellow, undercurl = true })
          vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { sp = colors.blue, undercurl = true })
          vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { sp = colors.cyan, undercurl = true })

          ----------------------------------------------------------------------
          -- Completion menu
          ----------------------------------------------------------------------
          vim.api.nvim_set_hl(0, "Pmenu", { bg = "#121212", fg = colors.fg })
          vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#242424", fg = colors.fg })
          vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#323232", bg = "#121212" })
        end,
      })
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true,
        contrast = "hard",
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
    end,
  },

  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent_background = true,
      gamma = 1.0,
      terminal_colors = true,
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        styles = { transparency = true },
        highlight_groups = {
          TelescopeBorder = { fg = "highlight_high", bg = "none" },
          TelescopeNormal = { bg = "none" },
          TelescopePromptNormal = { bg = "base" },
          TelescopeResultsNormal = { fg = "subtle", bg = "none" },
          TelescopeSelection = { fg = "text", bg = "base" },
          TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
        },
      })
    end,
  },

  {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = true,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker",
        transparent = true,
        term_colors = true,
        code_style = {
          comments = "italic",
          keywords = "none",
          functions = "none",
          strings = "none",
          variables = "none",
        },
      })
    end,
  },

  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
        sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false, -- dims inactive windows
        lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

        on_colors = function(colors) end,
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
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
        end,
      })
    end,
  },
}
