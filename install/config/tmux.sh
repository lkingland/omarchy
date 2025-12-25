# Install TPM (Tmux Plugin Manager)
if [[ ! -d ~/.config/tmux/plugins/tpm ]]; then
  mkdir -p ~/.config/tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi

# Install Catppuccin theme (must be cloned manually, not via TPM)
if [[ ! -d ~/.config/tmux/plugins/catppuccin ]]; then
  mkdir -p ~/.config/tmux/plugins/catppuccin
  git clone https://github.com/catppuccin/tmux ~/.config/tmux/plugins/catppuccin/tmux
fi

# Create resurrect cache directory
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/tmux/resurrect"
