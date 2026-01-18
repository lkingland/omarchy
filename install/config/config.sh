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

# Symlink GPG config files
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg
for conf in ~/.local/share/omarchy/default/gpg/*.conf; do
  name=$(basename "$conf")
  ln -sf "$conf" ~/.gnupg/"$name"
done

# Use Brave as default browser
xdg-settings set default-web-browser brave-browser.desktop
xdg-mime default brave-browser.desktop x-scheme-handler/http
xdg-mime default brave-browser.desktop x-scheme-handler/https
