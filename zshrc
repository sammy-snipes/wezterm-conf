# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Plugins (add more as needed: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
plugins=(git z sudo)

source $ZSH/oh-my-zsh.sh

# History
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Aliases (customize these)
alias vim="nvim"
alias ll="ls -la"
alias la="ls -a"

# Starship prompt
eval "$(starship init zsh)"

# Optional: zsh-autosuggestions (install separately)
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Optional: zsh-syntax-highlighting (install separately)
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Optional: fzf keybindings
# eval "$(fzf --zsh)"
