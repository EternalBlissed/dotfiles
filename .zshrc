# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# Zsh completion system
zstyle :compinstall filename '/home/eternal/.zshrc'
autoload -Uz compinit
compinit

# Locale settings
export LANG="en_US.UTF-8"

# Default editor
export EDITOR="nvim"

# PATH modifications
export PATH="$HOME/.npm-global/bin:$HOME/.local/bin:$HOME/.bun/bin:$HOME/.cargo/bin:$HOME/go/bin:/usr/local/bin:$HOME/Scripts:$PATH"

# Environment variables for specific applications
export CMUS_HOME=~/.config/cmus
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=qt6ct

# XDG environment variables
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export XDG_DATA_DIRS="$HOME/.local/share:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share/:/usr/share/"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Custom functions
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Aliases
alias ls="eza -a"
alias cat="bat"
alias code="codium"
alias internet-speed='speedtest-cli --simple --secure'

# Wayland setup
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway
fi 

# Starship prompt
eval "$(starship init zsh)"

# Zsh plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FZF
source <(fzf --zsh)

# Run krabby
krabby random --no-title
