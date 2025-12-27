# Copy over Omarchy configs (nvim is symlinked, not copied)
mkdir -p ~/.config
for item in ~/.local/share/omarchy/config/*; do
  name=$(basename "$item")
  [ "$name" = "nvim" ] && continue
  cp -R "$item" ~/.config/
done

# Symlink nvim config (allows tracking in omarchy repo)
if [ -d ~/.local/share/omarchy/config/nvim ]; then
  if [ ! -L ~/.config/nvim ]; then
    rm -rf ~/.config/nvim
    ln -sf ~/.local/share/omarchy/config/nvim ~/.config/nvim
  fi
fi

# Use default bashrc from Omarchy
cp ~/.local/share/omarchy/default/bashrc ~/.bashrc
