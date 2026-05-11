# Setup GPG agent configuration for SSH authentication (YubiKey support)
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg

if [[ ! -f ~/.gnupg/gpg-agent.conf ]]; then
  cp ~/.local/share/omarchy/default/gpg/gpg-agent.conf ~/.gnupg/
  chmod 600 ~/.gnupg/gpg-agent.conf
fi

# Install polkit rule allowing wheel-group users to access pcscd. Needed
# because gpg-agent/scdaemon run detached from any logind session and
# pcscd 2.4.x enforces "active session" via polkit, which would otherwise
# deny YubiKey access for SSH/GPG.
sudo install -m 644 -o root -g root \
  ~/.local/share/omarchy/default/polkit/99-pcscd-wheel.rules \
  /etc/polkit-1/rules.d/99-pcscd-wheel.rules

# Restart gpg-agent to pick up new config
gpgconf --kill gpg-agent || true
gpgconf --launch gpg-agent || true
