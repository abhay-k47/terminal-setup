brew install --cask ghostty
brew install zsh
brew install tmux
brew install nvim
brew install llvm
brew install clang-format
brew install cmake
brew install bear
brew install ripgrep
brew install node
brew install zoxide
brew install fzf
brew install rust
cargo install stylua
cargo install git-delta

# Install nerd fonts
mkdir -p ~/.local/share/fonts && \
  cd ~/.local/share/fonts && \
  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz && \
  tar -xvf JetBrainsMono.tar.xz && \
  rm -r JetBrainsMono.tar.xz
