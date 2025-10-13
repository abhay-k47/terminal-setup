return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    cmp.setup {
      completion = { completeopt = "menu, menuone, preview, noselect" },
      snippet = {
        -- haven't setup snippet engine at the moment
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-space>"] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(
          function(fallback)
            if cmp.visible() then
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-g>u", true, false, true), "n", true)  -- Create an undo break
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end,
          { "i", "s" }
        )
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({ { name="buffer" }, { name ="nvim_lsp" } })
    }
  end
}

