------------------- Basic Vim Setup -------------------
-- Leader key setup
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Display and editing preferences
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true

-- Undo settings
-- vim.opt.undofile = true
-- Option to persist undo (enables undo even after reopening a file).
-- Disabled here intentionally — can configure per file if needed.

-- Search behavior
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI and layout
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Indentation and tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = true

------------------- Useful Vim Stuff -------------------
-- Set to true if you have a Nerd Font installed and selected in terminal
vim.g.have_nerd_font = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Decrease update time for faster UI response
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time for which-key
vim.opt.timeoutlen = 300

-- Display whitespace characters for better visibility
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live as you type
vim.opt.inccommand = 'split'

-- Sync clipboard between OS and Neovim.
-- Scheduled after UiEnter to prevent startup slowdown.
vim.schedule(
  function()
    vim.opt.clipboard = 'unnamedplus'
  end
)

-- Turn off lsp logging
vim.lsp.set_log_level("off")
-- Turn on for debugging:
-- vim.lsp.set_log_level("debug")

