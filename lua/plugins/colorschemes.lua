return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- Default dark theme: hard contrast
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
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
        inverse = true, -- invert bg for search, diffs, statuslines and errors
        contrast = "hard", -- dark mode: hard contrast
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })

      -- Helper commands so you can easily switch variants:
      -- :GruvboxDarkHard  -> dark mode, hard contrast (default)
      -- :GruvboxLightSoft -> light mode, soft contrast, transparent
      vim.api.nvim_create_user_command("GruvboxDarkHard", function()
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
        vim.o.background = "dark"
        vim.cmd("colorscheme gruvbox")
      end, {})

      vim.api.nvim_create_user_command("GruvboxLightSoft", function()
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
          contrast = "soft", -- light mode: soft contrast
          palette_overrides = {},
          overrides = {},
          dim_inactive = false,
          transparent_mode = true, -- transparent background
        })
        vim.o.background = "light"
        vim.cmd("colorscheme gruvbox")
      end, {})
    end,
  },

  -- Tokyodark theme
  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
    opts = {
      transparent_background = true,
      gamma = 1.0,
    },
  },

  -- Rose Pine theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      styles = { transparency = true },
      disable_background = true,
      disable_float_background = true,
    },
  },
}
