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

For live testing of config changes, it's acceptable to edit files in ~/.config
directly, but any changes must be made here as well for source control.

This repository is managed with jj (jujutsu).  Please use jj commands directly
rather than git commands unless necessary.

The repo is configured with no immutable commits (`immutable_heads() = none()`).
This allows rebasing our fork onto upstream even after pushing to origin. See
`.jj/repo/config.toml`.

Every change to these dotfiles should be made in it's own jj change creating a
clean history.  An entry should be added to the README.md under "Customizations"
explaining the change made.

## System Updates

Updating this sytem is also slightly different.  We must first update the
fork from upstream before running the "omarchy-sync" script.  Please read this
script to understand what it does before execution. in short it:
- fetches the upstream change
- rebases the current
- provides an opportunity to resolve conflicts
- updates the master bookmark
- syncs the underlying git repository  with an explicit checkout
- runs the builtin omarchy-update which utilizes pacman for system updates.


