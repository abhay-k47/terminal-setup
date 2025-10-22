# Terminal Setup

A comprehensive terminal configuration setup for **Zsh**, **Tmux**, and **Neovim**, bundled with essential plugins and tools for a modern and efficient development environment. Ideal for developers who want a fully featured, ready-to-use terminal on macOS or Linux.

---

## Features

### Zsh
- **Powerlevel10k** theme for a fast and informative prompt.
- **Plugins included:**
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
  - `zsh-history-substring-search`
- Custom aliases and options for productivity.

### Tmux
- Fully configured Tmux environment with `tmux.conf`.
- Includes plugins:
  - `tpm` (Tmux Plugin Manager)
  - `tmux-sensible` for sane defaults
  - `catppuccin-tmux` theme

### Neovim
- Configured with **Lua-based modern setup**.
- Lazy-loading plugins for speed.
- Includes LSP support (via `clangd` for C/C++), auto-completion, Git integration, and fuzzy finding.
- Pre-configured:
  - `lualine` statusline
  - `telescope` for file search
  - `neogit` for Git workflow
  - `comment.nvim` for easy commenting
  - `copilot` integration for AI code suggestions
  - Syntax highlighting, keymaps, autocmds, and more.

### Git
- Centralized Git configuration.

### Ghostty
- Terminal sharing configuration for remote access.

### Other
- `.clang-format` for consistent C/C++ formatting.

---

## Installation

1. Clone the repository (including submodules), run the installation script, and link the configuration files to your home directory:
   ```bash
   git clone --recurse-submodules https://github.com/abhay-k47/terminal-setup.git
   cd terminal-setup
   bash install.sh
   ln -s $(pwd)/.config $HOME/.config
   ln -s $(pwd)/.clang-format $HOME/.clang-format
   ln -s $HOME/.config/zsh/config $HOME/.zshrc
   ```
2. Open Neovim and run `:Lazy sync` to update plugins, then `:Copilot setup` to authorize and enable GitHub Copilot.
