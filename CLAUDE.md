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

Every change to these dotfiles should be made in it's own jj change creating a
clean history.  An entry should be added to the README.md under "Customizations"
explaining the change made.

## System Updates

Updating this system uses a merge-based workflow to keep local customizations
separate from upstream changes.  Run the "omarchy-sync" script (in ~/sh) which:
- fetches upstream changes
- creates a merge commit incorporating upstream into master
- provides an opportunity to resolve conflicts
- updates the master bookmark to the merge commit
- syncs the underlying git repository with an explicit checkout
- runs the builtin omarchy-update which utilizes pacman for system updates


