# WezTerm + Zsh Config

A clean terminal setup with Catppuccin Mocha theme, vim-style keybindings, and Starship prompt.

## Quick Install (macOS)

```bash
# Install everything
brew install --cask wezterm font-jetbrains-mono-nerd-font
brew install starship

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy configs
cp wezterm.lua ~/.wezterm.lua
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml

# Add zshrc contents to your .zshrc (or replace it)
cat zshrc >> ~/.zshrc
```

Restart your terminal.

---

## What's Included

| File | What it does |
|------|--------------|
| `wezterm.lua` | Terminal emulator config (theme, keybinds, opacity) |
| `starship.toml` | Prompt config (git status, directory, time) |
| `zshrc` | Shell config (oh-my-zsh, plugins, aliases) |

---

## WezTerm Keybindings

### Splits
| Action | Binding |
|--------|---------|
| Split left/down/up/right | `Cmd + h/j/k/l` |

### Pane Navigation
| Action | Binding |
|--------|---------|
| Move left/down/up/right | `Ctrl + h/j/k/l` |

### Pane Resize
| Action | Binding |
|--------|---------|
| Resize left/down/up/right | `Cmd + Shift + h/j/k/l` |

### Other
| Action | Binding |
|--------|---------|
| Close pane | `Cmd + w` |
| Zoom toggle | `Cmd + z` |
| Font size +/- | `Ctrl + =/-` |
| Font size reset | `Ctrl + 0` |

---

## Optional Extras

```bash
# Better zsh plugins
brew install zsh-autosuggestions zsh-syntax-highlighting

# Then uncomment the lines in your .zshrc

# Useful CLI tools
brew install fzf ripgrep eza bat fd neovim
```

---

## Linux

```bash
# WezTerm
flatpak install flathub org.wezfurlong.wezterm
# or download from https://wezfurlong.org/wezterm/install/

# Font: download JetBrainsMono Nerd Font from https://www.nerdfonts.com
# Extract to ~/.local/share/fonts/ then: fc-cache -fv

# Starship
curl -sS https://starship.rs/install.sh | sh

# Config locations
mkdir -p ~/.config/wezterm
cp wezterm.lua ~/.config/wezterm/wezterm.lua
cp starship.toml ~/.config/starship.toml

# Note: Change CMD to ALT in wezterm.lua keybindings
```
