-------------------  Prerequisite -------------------
-- Install ripgrep
-- Install Nerd Font or set vim.g.have_nerd_font = false

-------------------  Load modular configs -------------------
require("config.options")   -- Basic vim options
require("config.keymaps")   -- Key mappings
require("config.autocmds")  -- Autocommands
require("config.lazy")      -- Plugin manager setup (lazy.nvim)

-------------------  Custom setup -------------------
require("core.clangformat") -- ClangFormat integration or other core setup

