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
    bun
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
export EDITOR="nvim"

export QT_QPA_PLATFORMTHEME=qt5ct

# TODO: not loading before running "zsh" for some reason
# Reading dotenv
[ ! -f .env ] || export $(grep -v '^#' .env | xargs)

#  ╭──────────────────────────────────────────────────────────╮
#  │ Aliases                                                  │
#  ╰──────────────────────────────────────────────────────────╯

alias v="nvim"
alias safev='NVIM_APPNAME=nvchadvim nvim'
alias rgf="rg --files --hidden | rg"
alias rn=". ranger"
alias gvim="nvim --listen ~/.cache/nvim/godot.pipe ."
alias pac-installed="pacman -Qqe | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pac-installed-all="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pac-list-unused="pacman -Qdt"
alias pac-remove-unused="pacman -Rsn $(pacman -Qdtq)"
alias dot="cd ~/dotfiles && nvim"
alias doti="~/dotfiles/install.sh"
alias archwiki="firefox /usr/share/doc/arch-wiki/html/en/Table_of_contents.html"
# alias rvim="XDG_CONFIG_HOME=~/.config/nvim.rust XDG_DATA_HOME=~/.local/share/nvim.rust nvim -u .config/nvim.rust/init.lua"

#  ╭──────────────────────────────────────────────────────────╮
#  │ Starship                                                 │
#  ╰──────────────────────────────────────────────────────────╯

eval "$(starship init zsh)"


# SSH-Agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi


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
