return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      current_line_blame_formatter = '<abbrev_sha> <author> - <summary> - <author_time:%R>',
      current_line_blame_opts = {
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 200,
      }
    }
    vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', { silent = true, desc = "Gitsigns blame toggle" })
  end
}

