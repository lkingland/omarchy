# Omarchy

This is a personalized fork of [omarchy.org](https://omarchy.org).


## Customizing

Customizations are made mostly to dotfiles in ./config
They are applied to the system with:
  ./config/config.sh

## Updating

Use the omarchy-sync script which
- Pulls upstream changes
- Rebases on upstream
- Allows opportunity to resolve conflicts
- Runs the upstream system updater omarchy-update

## Bugs/Inconveniences

- Applying config breaks Moonlight stream


## Customizations

### Git Config
Default branch set to `main`, commit signing enabled, user identity configured.

### Shell: Nushell
Replaces bash with [Nushell](https://www.nushell.sh/) featuring vi mode, structured data pipelines, and fuzzy completion. Native `ls` for tabular output; eza available via `lse`, `lle`, etc.

### YubiKey SSH Authentication
GPG agent configured for SSH authentication via hardware security key.

### Tokyo Night OLED Theme
Custom theme with true black (#000000) backgrounds for OLED displays.

### Starship Prompt
Tokyo Night color palette with command duration display.

### Tmux
Terminal multiplexer with Tokyo Night theme, vim-tmux-navigator, and session persistence.

### Vim-style Window Navigation
Hyprland keybindings: `SUPER+HJKL` for focus, `SUPER+SHIFT+HJKL` for movement. Defaults `SUPER+J` (toggle split) and `SUPER+K` (keybindings) relocated to `SUPER+CTRL+J/K`.

### Waybar
Status bar positioned at bottom with auto-hide, plus RAM and disk usage indicators.

## License

Omarchy is released under the [MIT License](https://opensource.org/licenses/MIT).
