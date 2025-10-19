return {
  "github/copilot.vim",
  event = "VimEnter",
  config = function()
    vim.g.copilot_enabled = 0
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })
    vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })

    vim.keymap.set("i", "<C-k>", 'copilot#Previous()', {
      expr = true,
      replace_keycodes = false,
      desc = "Previous Copilot suggestion",
    })
    vim.keymap.set("i", "<C-j>", 'copilot#Next()', {
      expr = true,
      replace_keycodes = false,
      desc = "Next Copilot suggestion",
    })
    vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = "Accept Copilot suggestion",
    })

    vim.g.copilot_filetypes = {
      ["*"] = true,        -- enable for all by default
      markdown = false,    -- disable for markdown
      text = false,        -- disable for plain text
      TelescopePrompt = false,
    }
  end
}
