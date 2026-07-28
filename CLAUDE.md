# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

```bash
# Rebuild and switch to new configuration
darwin-rebuild switch --flake .#MBP

# Update all flake dependencies
nix flake update

# Update a specific input
nix flake lock --update-input nixpkgs
```

## Architecture

This is a declarative macOS system configuration using Nix flakes, combining nix-darwin (system-level) and home-manager (user-level) configuration.

**Entry point:** `flake.nix` defines a single Darwin configuration `MBP` for Apple Silicon.

### Module Structure

**System modules** (`modules/`) - nix-darwin configuration:
- `core.nix` - Nix settings (flakes, Lix package manager, garbage collection)
- `system.nix` - macOS defaults, fonts, TouchID sudo, shell support
- `brew.nix` - Homebrew taps, brews, and casks
- `users.nix` - User account configuration

**Home modules** (`home/`) - home-manager configuration:
- `default.nix` - Entry point, imports all submodules and external flake inputs
- `core.nix` - Nixvim (Neovim) configuration with Monokai Pro theme
- `shell.nix` - Fish shell with pure prompt, Ayu Dark theme
- `apps.nix` - Terminal apps (Alacritty, Zellij), window managers (Yabai, Aerospace), CLI tools
- `git.nix` - Git with 1Password SSH signing
- `nvim.nix` - Alternative nvf Neovim config (currently disabled)
- `pythonPkgs.nix` - Python packages

### Key Integration Points

- Home-manager is embedded in nix-darwin via `home-manager.darwinModules.home-manager`
- `useGlobalPkgs = true` shares the system nixpkgs with home-manager
- External inputs (nixvim, catppuccin, nvf, nix-index) are passed to home config via `extraSpecialArgs`
- Some configs use out-of-store symlinks for version-controlled files (e.g., `home/zed_settings.json`)

### Dependency Sources

All inputs follow `nixpkgs-unstable`. Key frameworks:
- nix-darwin: macOS system management
- home-manager: User environment
- nixvim: Nix-native Neovim configuration
- nvf: Alternative Neovim framework
- catppuccin: Color schemes
