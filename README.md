# WezTerm Config

A clean WezTerm setup with Catppuccin Mocha theme and vim-style keybindings.

## Install

### 1. Install WezTerm

```bash
# macOS (Homebrew)
brew install --cask wezterm

# Linux (Flatpak)
flatpak install flathub org.wezfurlong.wezterm

# Or download from https://wezfurlong.org/wezterm/install/
```

### 2. Install the font

```bash
# macOS
brew install --cask font-jetbrains-mono-nerd-font

# Linux (most distros)
# Download from https://www.nerdfonts.com/font-downloads
# Extract to ~/.local/share/fonts/ then run: fc-cache -fv
```

### 3. Copy the config

```bash
# macOS
cp wezterm.lua ~/.wezterm.lua

# Linux
mkdir -p ~/.config/wezterm
cp wezterm.lua ~/.config/wezterm/wezterm.lua
```

### 4. Restart WezTerm

Config reloads automatically, but restart to be safe.

---

## Keybindings

### Splits (vim-style directions)

| Action | Binding |
|--------|---------|
| Split left | `Cmd + h` |
| Split down | `Cmd + j` |
| Split up | `Cmd + k` |
| Split right | `Cmd + l` |

### Pane Navigation (vim-style)

| Action | Binding |
|--------|---------|
| Move left | `Ctrl + h` |
| Move down | `Ctrl + j` |
| Move up | `Ctrl + k` |
| Move right | `Ctrl + l` |

### Pane Resize

| Action | Binding |
|--------|---------|
| Resize left | `Cmd + Shift + h` |
| Resize down | `Cmd + Shift + j` |
| Resize up | `Cmd + Shift + k` |
| Resize right | `Cmd + Shift + l` |

### Pane Management

| Action | Binding |
|--------|---------|
| Close pane | `Cmd + w` |
| Zoom/unzoom (fullscreen toggle) | `Cmd + z` |

### Zoom (Font Size)

| Action | Binding |
|--------|---------|
| Zoom in | `Ctrl + =` |
| Zoom out | `Ctrl + -` |
| Reset zoom | `Ctrl + 0` |

---

## Features

- **Catppuccin Mocha** color scheme
- **Semi-transparent** window (0.925 opacity)
- **Tab bar at bottom** with custom styling
- **Dim inactive panes** for focus
- **Vim-style** pane splits and navigation
- **Status bar experiments** - uncomment options in the config to try different styles

---

## Linux Note

On Linux, replace `CMD` with `ALT` or `SUPER` in the keybindings section of `wezterm.lua` if needed.
