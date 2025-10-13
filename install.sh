brew install --cask ghostty
brew install tmux
brew install nvim
brew install llvm
brew install bear
brew install ripgrep
brew install node

# Install nerd fonts
mkdir -p ~/.local/share/fonts && \
  cd ~/.local/share/fonts && \
  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz && \
  tar -xvf JetBrainsMono.tar.xz && \
  rm -r JetBrainsMono.tar.xz
