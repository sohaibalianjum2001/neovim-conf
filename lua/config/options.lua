-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- GUI font (for Neovide, Neovim-Qt, etc.)
-- Default font for all GUIs (Neovide will override this in init.lua)
vim.o.guifont = "JetBrainsMono Nerd Font:h14"
vim.o.linespace = 2
vim.o.termguicolors = true

-- Set relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Set tab and indentation settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Enable mouse support
vim.o.mouse = "a"
-- Enable clipboard integration
vim.o.clipboard = "unnamedplus"
-- Set a comfortable scroll offset
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

--make sure there is always 8 lines spare left while writing code
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
