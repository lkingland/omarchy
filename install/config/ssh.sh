# Setup SSH configuration for GPG agent integration (YubiKey support)
mkdir -p ~/.ssh
chmod 700 ~/.ssh

if [[ ! -f ~/.ssh/config ]]; then
  cp ~/.local/share/omarchy/default/ssh/config ~/.ssh/
  chmod 600 ~/.ssh/config
fi
