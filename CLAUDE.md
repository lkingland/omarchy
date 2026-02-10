# Omarchy

A full fork of the Omarchy Arch distribution, used as a replacement for
dotfiles on this primary dev machine.

## Architecture

This system is a fork of Omarchy, an arch distribution with the hyprland
window manager.  This is a fork "https://github.com/lkingland/omarchy".

This configuration contains all customizations for my personal applicaiton of
Omarchy, so it functions conceptually as a "dotfiles".

## Configuration Updates

The way that configuration changes are applied is to edit them here in
this repository, and then run ./install/config/config.sh which takes the configuration
here and writes it to the active system (~/.config).

**Exception:** Neovim config (`config/nvim/`) is symlinked directly to `~/.config/nvim`,
so changes take effect immediately without running config.sh.

For live testing of config changes, it's acceptable to edit files in ~/.config
directly, but any changes must be made here as well for source control.

This repository is managed with jj (jujutsu).  Please use jj commands directly
rather than git commands unless necessary.

Every change to these dotfiles should be made in its own jj change creating a
clean history.  An entry should be added to the README.md under "Customizations"
explaining the change made.

### jj Workflow

The working copy (`@`) is always a mutable jj change. Follow these steps to
keep changes cleanly separated:

1. **Check for existing work first:** Run `jj status` and `jj diff` before
   making any edits. If `@` already has changes, describe them
   (`jj describe -m "..."`) and run `jj new` to get a clean working copy.
2. **One logical change per `@`:** Edit the config file(s) + README entry
   together in the current working copy.
3. **Apply config:** Run `./install/config/config.sh` to copy changes to
   `~/.config/` (except nvim, which is symlinked).
4. **Describe and advance:** `jj describe -m "component: summary"` then
   `jj new` to start the next change.

Note: The omarchy skill (`.claude/skills/omarchy/SKILL.md`) has been updated
to reflect the fork workflow. It directs edits to this repo, not `~/.config/`.

## System Updates

Updating this system uses a merge-based workflow to keep local customizations
separate from upstream changes.  Run the "omarchy-sync" script (in ~/sh) which:
- fetches upstream changes
- creates a merge commit incorporating upstream into master
- provides an opportunity to resolve conflicts
- updates the master bookmark to the merge commit
- syncs the underlying git repository with an explicit checkout
- runs the builtin omarchy-update which utilizes pacman for system updates


