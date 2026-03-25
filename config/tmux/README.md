# Tmux Configuration

## Setup

1. Install TPM (Tmux Plugin Manager):
   ```
   git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
   ```
2. Load the config:
   ```
   tmux source ~/.config/tmux/tmux.conf
   ```
3. Install plugins by pressing `prefix I` (capital I) inside tmux.

To update plugins later, press `prefix U`.

## Keybindings

Prefix: `Ctrl+Space` (fallback: `Ctrl+b`)

## Sessions

| Key | Action |
|-----|--------|
| `prefix f` | Session/window tree picker |
| `prefix F` | Fuzzy-find session (fzf) |
| `prefix l` | Toggle to previous session |
| `prefix s 1-9` | Jump to session by number |
| `prefix t` | Tree view (sessions + windows) |
| `prefix d` | Detach from session |

## Windows

| Key | Action |
|-----|--------|
| `prefix 1-9` | Jump to window by number |
| `prefix c` | New window |
| `prefix r` | Rename window |
| `prefix Tab` | Next window |
| `prefix Shift+Tab` | Previous window |
| `prefix Left` | Move window left in order |
| `prefix Right` | Move window right in order |
| `prefix &` | Kill window |

## Panes

| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` | Navigate panes (no prefix, works across vim) |
| `prefix v s` | Vertical split |
| `prefix s p` | Horizontal split |
| `prefix H/J/K/L` | Swap pane directionally |
| `prefix z` | Toggle pane zoom (fullscreen) |
| `prefix x` | Kill pane |

## Copy Mode

| Key | Action |
|-----|--------|
| `prefix [` | Enter copy mode |
| `v` | Begin selection |
| `y` | Yank selection |

## Hugr Agents

| Key | Action |
|-----|--------|
| `prefix a` | Jump to blocked agent |
| `prefix A` | Jump to completed agent |
