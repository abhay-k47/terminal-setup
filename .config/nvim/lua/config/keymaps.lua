------------------- Keymaps -------------------

-- Clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

------------------- Terminal within Vim -------------------
-- Exit terminal mode easily with <Esc> or <C-w>
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { silent = true })
vim.keymap.set('t', '<C-w>', [[<C-\><C-n>]], { silent = true })

------------------- Diagnostic Keymaps -------------------
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

