return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    require('neogit').setup()
    vim.keymap.set('n', '<leader>gs', ':Neogit<CR>', { silent = true, desc = "Neogit status" })
    vim.keymap.set('n', '<leader>gB', ':Telescope git_branches<CR>', { silent = true, desc = "Telescope git branch" })
    vim.keymap.set('n', '<leader>gl', ':Neogit log<CR>', { silent = true, desc = "NeoGit log" })
  end
}

