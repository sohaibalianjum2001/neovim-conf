-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable auto-commenting on new line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
  desc = "Disable auto-comment on new line",
})

-- When a session restores buffers, skip the start screen and jump to a real file.
-- If no real file buffers exist (e.g. previous session had none), open Telescope in this project.
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(function()
      local bufs = vim.fn.getbufinfo({ buflisted = 1 })
      local found = false
      -- Find the first "normal" file buffer and jump to it
      for _, buf in ipairs(bufs) do
        if buf.name ~= "" and buf.listed then
          pcall(vim.api.nvim_set_current_buf, buf.bufnr)
          found = true
          break
        end
      end
      -- If no real file buffer is available and we're on an empty buffer,
      -- open Telescope file picker in the current project directory
      if not found then
        local cur = vim.api.nvim_get_current_buf()
        local name = vim.api.nvim_buf_get_name(cur)
        if name == "" or vim.fn.line2byte("$") == -1 then
          pcall(function()
            require("telescope.builtin").find_files({ cwd = vim.loop.cwd() })
          end)
        end
      end
    end, 150)
  end,
  desc = "Jump from start screen or open Telescope in empty session",
})

-- Remember last used colorscheme and restore it on next start
local theme_state = vim.fn.stdpath("data") .. "/last_colorscheme.txt"

-- Save colorscheme whenever it changes (e.g. via <leader>uC)
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function(ev)
    pcall(vim.fn.writefile, { ev.match }, theme_state)
  end,
  desc = "Persist last colorscheme",
})

-- On dashboard/landing buffers, map `p` to global project search (home dir)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "snacks_dashboard", "alpha", "starter", "lazy" },
  callback = function(ctx)
    local bufnr = ctx.buf
    -- Defer so dashboard's own keymaps are set first, then we override `p`
    vim.schedule(function()
      vim.keymap.set("n", "p", function()
        pcall(function()
          require("telescope.builtin").find_files({ cwd = vim.loop.os_homedir() })
        end)
      end, { buffer = bufnr, desc = "Project search (all folders)" })
    end)
  end,
  desc = "On landing page: `p` opens project search over all folders",
})


