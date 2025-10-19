return {
  "CopilotC-Nvim/CopilotChat.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {
    debug = true, -- Enable debugging
    show_help = true, -- Show help actions
    window = {
      layout = "float",
      width = 0.4,
    },
  },
  keys = {
    { "<leader>ccv", ":CopilotChatToggle<CR>", desc = "CopilotChat - Toggle window" },
    { "<leader>ccl", ":CopilotChatReset<CR>", desc = "CopilotChat - Clear buffer and chat history" },
    -- Code related commands
    { "<leader>cce", ":CopilotChatExplain<CR>", mode = "v", desc = "CopilotChat - Explain code" },
    { "<leader>ccd", ":CopilotChatDocs<CR>", mode = "v", desc = "CopilotChat - Document code" },
    { "<leader>ccf", ":CopilotChatFix<CR>", mode = "v", desc = "CopilotChat - Fix code" },
    { "<leader>cco", ":CopilotChatOptimize<CR>", mode = "v", desc = "CopilotChat - Optimize code" },
    { "<leader>ccr", ":CopilotChatReview<CR>", mode = "v", desc = "CopilotChat - Review code" },
    { "<leader>cct", ":CopilotChatTests<CR>", mode = "v", desc = "CopilotChat - Generate tests" },
  },
}

