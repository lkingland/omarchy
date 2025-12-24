# Setup GPG agent configuration for SSH authentication (YubiKey support)
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg

if [[ ! -f ~/.gnupg/gpg-agent.conf ]]; then
  cp ~/.local/share/omarchy/default/gpg/gpg-agent.conf ~/.gnupg/
  chmod 600 ~/.gnupg/gpg-agent.conf
fi

# Restart gpg-agent to pick up new config
gpgconf --kill gpg-agent || true
gpgconf --launch gpg-agent || true
