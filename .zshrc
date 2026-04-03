# =============================================================================
# OH MY ZSH CONFIGURATION
# =============================================================================
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Disable Oh My Zsh's internal theming engine so Starship can take over
ZSH_THEME=""

# Disable weekly auto-update prompts (updates quietly in background)
zstyle ':omz:update' mode auto

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
plugins=(
    git
    docker
    golang
    python
    sudo
    z
    extract
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


# =============================================================================
# ENVIRONMENT VARIABLES & PATHS
# =============================================================================
# Default Editor
export EDITOR="nvim"
export VISUAL="nvim"

# Go Development Paths
export GOPATH="$HOME/go"
export GOROOT="/usr/lib/go"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# Python / Local Binaries Path
export PATH="$HOME/.local/bin:$PATH"


# =============================================================================
# ALIASES
# =============================================================================
# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -lh --color=auto"
alias la="ls -lah --color=auto"
alias dir="dir --color=auto"

# Wayland / Config Shortcuts
alias reload-waybar="killall waybar && waybar > /dev/null 2>&1 &"
alias reload-hypr="hyprctl reload"
alias config-zsh="nvim ~/.zshrc"
alias config-waybar="nvim ~/.config/waybar/config"
alias config-hypr="nvim ~/.config/hypr/hyprland.conf"
alias config-kitty="nvim ~/.config/kitty/kitty.conf"

# Development Shortcuts
alias vim="nvim"
alias dco="docker-compose"
alias dps="docker ps -a"
alias py="python3"
alias pyenv-activate="source .venv/bin/activate"

# System Updates (Arch specific)
alias update="sudo pacman -Syu"
alias cleanup="sudo pacman -Rns \$(pacman -Qtdq)"


# =============================================================================
# ZSH OPTIONS
# =============================================================================
# History configurations
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS   # Do not record an event that was just recorded again
setopt HIST_REDUCE_BLANKS     # Remove extra blanks from each command line being added
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY          # Share history between all sessions

# Directory navigation
setopt AUTO_CD                # If a command is just a path, cd into it
setopt AUTO_PUSHD             # Make cd push the old directory onto the directory stack


# =============================================================================
# PROMPT INITIALIZATION (MUST BE AT THE VERY BOTTOM)
# =============================================================================
# Initialize Starship Prompt
eval "$(starship init zsh)"

# Initialize Zellij (Terminal Multiplexer) - Uncomment if you want it to launch automatically
# if [[ -z "$ZELLIJ" ]]; then
#     if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
#         zellij attach -c
#     else
#         zellij
#     fi
# fi
