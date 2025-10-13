------------------- ClangFormat Setup -------------------
-- Provides a `:ClangFormat` command and <leader>cf keymap
-- to format the current file using clang-format.

-- Define user command
vim.api.nvim_create_user_command('ClangFormat',
  function()
    local file = vim.api.nvim_buf_get_name(0)
    if file == '' then
      vim.notify('No file to format', vim.log.levels.WARN)
      return
    end
    -- Run clang-format on the current file
    vim.cmd('silent !clang-format -i ' .. vim.fn.shellescape(file) .. ' > /dev/null 2>&1')
    -- Reload buffer to show changes
    vim.cmd('edit')
  end,
  { desc = 'Format current file with clang-format' }
)

vim.keymap.set(
  'n',
  '<leader>cf',
  ':ClangFormat<CR>',
  { noremap = true, silent = true, desc = 'Format file with clang-format' }
)
