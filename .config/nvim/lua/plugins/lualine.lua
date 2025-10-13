return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        -- single statusline across splits
        -- globalstatus = true, 
        theme = 'everforest',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          { 'branch', icon = '' },
          { 'diff', symbols = { added = '+', modified = '~', removed = '-' } }
        },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype', 'diagnostics' },
        lualine_y = { 'progress' },
        lualine_z = { { 'datetime', style = '%H:%M' } }
      }
    }
  end
}

