# Omarchy

This is a personalized fork of [omarchy.org](https://omarchy.org).


## Customizing

Customizations are made mostly to dotfiles in ./config
They are applied to the system with:
  ./config/config.sh

## Updating

Use the omarchy-sync script (in ~/sh) which:
- Fetches upstream changes
- Creates a merge commit to incorporate upstream
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
Two-line prompt with jj/git status, kubernetes context, and Tokyo Night colors.

### Tmux
Terminal multiplexer with Tokyo Night theme, vim-tmux-navigator, and session persistence. Dynamic session switching via `prefix s 1-9,0` (sorted by creation order), fzf popup selector (`prefix F`), and indexed tree view (`prefix f`).

### Vim-style Window Navigation
Hyprland keybindings: `SUPER+HJKL` for focus, `SUPER+SHIFT+HJKL` for movement. Defaults `SUPER+J` (toggle split) and `SUPER+K` (keybindings) relocated to `SUPER+CTRL+J/K`.

### Waybar
Status bar positioned at bottom with auto-hide, plus RAM and disk usage indicators.

### Hyprland
Faster key repeat, touchpad gestures, workspace navigation (SUPER+Q/E), no shadows, smart gaps.

### Neovim
LazyVim config with custom keymaps, Harpoon, Go debugging, Obsidian, and vim-tmux-navigator.

### Carapace
Rich shell completions for 1000+ commands, bridged from zsh/fish/bash.

### AI Agents
CLAUDE.md with project context and jj workflow instructions for AI coding assistants.

### Claude Code Neovim Integration
[claudecode.nvim](https://github.com/coder/claudecode.nvim) plugin for Claude CLI integration. All keybindings under `<leader>a`: toggle (`ac`), focus (`af`), resume (`ar`), continue (`aC`), model select (`am`), add buffer (`ab`), send selection (`as`), accept/deny diffs (`aa`/`ad`).

### Default Browser
Brave set as default browser for HTTP/HTTPS links.

## License

Omarchy is released under the [MIT License](https://opensource.org/licenses/MIT).
