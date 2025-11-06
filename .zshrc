#  ╭──────────────────────────────────────────────────────────╮
#  │ Oh My Zsh                                                │
#  ╰──────────────────────────────────────────────────────────╯

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

# this has to be set before loading plugins
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true

plugins=(
    git
    fzf
    zsh-nvm
    zsh-interactive-cd
    # Completions - Start
    # bun
    zsh-better-npm-completion
    # Completions - End
    zsh-autosuggestions
    zsh-syntax-highlighting
    history-substring-search
)

source $ZSH/oh-my-zsh.sh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#  ╭──────────────────────────────────────────────────────────╮
#  │ Variables                                                │
#  ╰──────────────────────────────────────────────────────────╯

export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/go/bin
export EDITOR="nvim"

export QT_QPA_PLATFORMTHEME=qt5ct

# Reading dotenv
if [ -f "$HOME/dotfiles/.env" ]; then
    while IFS= read -r line; do
        if [[ ! $line =~ ^# ]]; then
            export "$line"
        fi
    done < "$HOME/dotfiles/.env"
fi

#  ╭──────────────────────────────────────────────────────────╮
#  │ Aliases                                                  │
#  ╰──────────────────────────────────────────────────────────╯

alias fcd='cd "$(rg --files --hidden --no-messages | xargs -n1 dirname | sort -u | fzf)"'
alias v="nvim"
alias rgf="rg --files --hidden | rg"
alias rn=". ranger"
alias gvim="nvim --listen ~/.cache/nvim/godot.pipe ."
alias pac-installed="pacman -Qqe | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pac-installed-all="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pac-list-unused="pacman -Qdt"
alias pac-remove-unused="pacman -Rsn $(pacman -Qdtq)"
# alias dot="cd ~/dotfiles && nvim"
alias doti="~/dotfiles/install.sh"
alias archwiki="firefox /usr/share/doc/arch-wiki/html/en/Table_of_contents.html"
# alias rvim="XDG_CONFIG_HOME=~/.config/nvim.rust XDG_DATA_HOME=~/.local/share/nvim.rust nvim -u .config/nvim.rust/init.lua"

#  ╭──────────────────────────────────────────────────────────╮
#  │ Starship                                                 │
#  ╰──────────────────────────────────────────────────────────╯

eval "$(starship init zsh)"


# SSH-Agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 16h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Start ssh-agent if not running and load env
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent -t 4h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi

# Always source the env file (if it exists)
if [[ -f "$XDG_RUNTIME_DIR/ssh-agent.env" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
fi

# Add your key if not already loaded
ssh-add -l &>/dev/null || ssh-add ~/.ssh/id_ed25519




#  ╭──────────────────────────────────────────────────────────╮
#  │ Dependencies                                             │
#  ╰──────────────────────────────────────────────────────────╯

source /usr/share/nvm/init-nvm.sh
source /usr/share/doc/find-the-command/ftc.zsh noprompt quiet
eval "$(zoxide init zsh)"

LFCD="$HOME/dotfiles/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
    alias lf="lfcd"
fi

# eval $(keychain --eval --agents ssh id_ed25519)

# bun completions
[ -s "/home/nilo/.bun/_bun" ] && source "/home/nilo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
