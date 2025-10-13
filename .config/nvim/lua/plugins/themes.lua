return {
  "folke/tokyonight.nvim",
  lazy = false, -- load immediately
  priority = 1000,-- load before other plugins to avoid highlight issues
  config = function()
      require('tokyonight').setup({
        style = 'night',       -- options: 'storm', 'night', 'day'
      })
      vim.cmd.colorscheme('tokyonight')
  end
}

