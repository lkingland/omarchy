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

### Job Control
`fg` alias for `job unfreeze` — resume the most recently frozen (Ctrl+Z) job.

### YubiKey SSH Authentication
GPG agent configured for SSH authentication via hardware security key.

### pcscd Polkit Rule
`default/polkit/99-pcscd-wheel.rules` allows `wheel` group users to access pcscd without an active logind session. pcscd 2.4.x enforces the `org.debian.pcsc-lite.access_pcsc` polkit action and only grants it to processes in an active session, but `gpg-agent`/`scdaemon` reparent to systemd and have no session — so YubiKey access (and thus ssh-via-GPG) was being silently rejected. Installed by `install/config/gpg-agent.sh`.

### Tokyo Night OLED Theme
Custom theme with true black (#000000) backgrounds for OLED displays.

### Starship Prompt
Two-line prompt with jj/git status, kubernetes context, and Tokyo Night colors.

### Tmux
Terminal multiplexer with Tokyo Night theme and vim-tmux-navigator. Dynamic session switching via `prefix s 1-9,0` (sorted by creation order), fzf popup selector (`prefix F`), indexed tree view (`prefix f`), and last-session toggle (`prefix l`). Directional pane swapping with `prefix H/J/K/L` (complements `Ctrl+hjkl` navigation). Session persistence (resurrect/continuum) disabled due to instability. Window-status pills use rounded powerline caps (U+E0B6/E0B4) with a `󰔱` zoom indicator on the active window.

### Vim-style Window Navigation
Hyprland keybindings: `SUPER+HJKL` for focus, `SUPER+SHIFT+HJKL` for movement. Defaults `SUPER+J` (toggle split) and `SUPER+K` (keybindings) relocated to `SUPER+CTRL+J/K`.

### Waybar
Status bar positioned at bottom with auto-hide, plus RAM and disk usage indicators.

### Hyprland
Faster key repeat, touchpad gestures, workspace navigation (SUPER+Q/E), no shadows, smart gaps.

### Neovim
LazyVim config with custom keymaps, Harpoon, Go debugging, Obsidian, and vim-tmux-navigator.

### Trouble Symbols Panel
[trouble.nvim](https://github.com/folke/trouble.nvim) symbols panel (`<leader>cs`) opens on the left as a 40-col split. Disabled `auto_preview` for symbols and lsp modes so cursor movement in the panel no longer follows in the main window — jump only on `<cr>`.

### Carapace
Rich shell completions for 1000+ commands, bridged from zsh/fish/bash.

### AI Agents
CLAUDE.md with project context and jj workflow instructions for AI coding assistants.

### Claude Code Neovim Integration
[claudecode.nvim](https://github.com/coder/claudecode.nvim) plugin for Claude CLI integration. All keybindings under `<leader>a`: toggle (`ac`), focus (`af`), resume (`ar`), continue (`aC`), model select (`am`), add buffer (`ab`), send selection (`as`), accept/deny diffs (`aa`/`ad`). Model picker updated to current Claude 4.6 models.

### 99 AI Plugin
ThePrimeagen's [99](https://github.com/ThePrimeagen/99) for targeted AI code replacement via visual selection. Select code, prompt, get inline replacement via `claude --print`. Keybindings under `<leader>9`. Model set to `claude-sonnet-4-6`.

### jj Diff Viewers
`jj show` / `jj diff` use git-style unified diffs piped through [delta](https://dandavison.github.io/delta/) for syntax highlighting. Difftastic remains available on demand via `jj ds <rev>` / `jj dd` aliases (structural/language-aware diff). For interactive multi-file review use `hunk show <rev>` / `hunk diff`.

### Linode CLI Token via Bitwarden
Wrapper functions in both nushell (`config/nushell/config.nu`) and bash (`default/bash/tools`) fetch `LINODE_CLI_TOKEN` from the Bitwarden vault (key `linode-cli-token`) on each invocation, instead of letting linode-cli persist it plaintext in `~/.config/linode-cli`. Token only exists in env for the duration of the call. The bash version sits alongside the existing `bw`/`jira` wrappers and is loaded non-interactively, so agent/script shells inherit it.

### VCSigns (replaces gitsigns)
[vcsigns.nvim](https://github.com/algmyr/vcsigns.nvim) replaces gitsigns.nvim for sign column indicators. VCS-agnostic with native jj support (its best-tested backend). Configured with `target_commit=0` so signs reflect only the diff within the current change `@` (compared against `@-`). The plugin's suggested `target_commit=1` widens the comparison base to `@--` (revset `@-::@`), combining the diffs of `@` and `@-` — useful for a new+squash flow but over-broad for "what's in the current change". Keymaps: `]h`/`[h` hunk navigation, `<leader>ghu` undo hunk, `<leader>ghd` inline diff, `<leader>ghf` fold around diffs, `]r`/`[r` step through commit history.

### jj.nvim
[jj.nvim](https://github.com/NicolasGB/jj.nvim) for full Jujutsu command integration inside Neovim. Interactive log buffer (`:J log`), describe editor (`:J desc`), diff splits (`:Jdiff`), squash/rebase, annotations/blame (`:J annotate`), bookmark/tag management, and PR opening.

### neo-tree-jj
[neo-tree-jj.nvim](https://github.com/Cretezy/neo-tree-jj.nvim) adds a `jj` source to neo-tree showing changed files (added/modified/deleted) from `jj diff --summary`. Replaces the git_status tab in the source selector when in a jj repo.

### fff.nvim File Finder
[fff.nvim](https://github.com/dmtrKovalenko/fff.nvim) replaces Snacks picker for file finding and grep. Rust-powered daemon with frecency scoring, typo-resistant fuzzy search, and git status awareness. Overrides `<leader>ff`, `<leader><space>`, `<leader>fF`, `<leader>fg`, and `<leader>/`. Snacks still handles all non-file pickers (help, keymaps, etc.).

### Default Browser
Brave set as default browser for HTTP/HTTPS links.

### Ollama with ROCm (AMD GPU)
Local LLM inference via [Ollama](https://ollama.com) with ROCm backend for AMD Radeon RX 7900 XT. Requires:
- `ollama-rocm` package (not `ollama`)
- `ollama` user in `render` and `video` groups
- Kernel parameter `amdgpu.cwsr_enable=0` to prevent MES firmware hangs on kernel 6.18+ with ROCm 7.x

## License

Omarchy is released under the [MIT License](https://opensource.org/licenses/MIT).
