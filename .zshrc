# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9

# original
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Case insensitive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Interactive menu for autocompletion
zstyle ':completion:*' menu select

# Enable advanced tab completion
autoload -Uz compinit && compinit

# -----------------------------------

export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=1000000000

setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE

# ----------------------------------

bindkey '\e[H' beginning-of-line # home key
bindkey '\e[F' end-of-line # end key
bindkey "\e[3~" delete-char # delete key

bindkey "\e[1;5C" forward-word # ctrl-left/right
bindkey "\e[1;5D" backward-word

# bindkey -v # vim mode
bindkey ^R history-incremental-search-backward
bindkey "^N" forward-word

# ----------------------------------

setopt noclobber

# ----------------------------------

alias ..="cd .."
alias ls="ls --color=auto"
alias l="ls -l --color=auto"
alias ll="ls -la --color=auto"
alias c="clear"
alias v="nvim"
alias vim="nvim"
alias grep="grep --color=auto"
alias ip="ip --color=auto"
alias pacman="pacman --color=auto"
alias r="ranger"
alias py="python3"
alias p="paru"
alias rm="rm -I"
alias t="tmux"
alias n="node"
alias g="git"
alias m="make"
alias git-adog="git log --all --decorate --oneline --graph"

# ----------------------------------

ex () {
if [ -f $1 ]; then
    case $1 in
        *.tar.bz2)  tar xjf $1  ;;
        *.tar.gz)   tar xzf $1  ;;
        *.bz2)      bunzip2 $1  ;;
        *.rar)      unrar x $1  ;;
        *.gz)       gunzip $1   ;;
        *.tar)      tar xf $1   ;;
        *.tbz2)     tar xjf $1  ;;
        *.tgz)      tar xzf $1  ;;
        *.zip)      unzip $1    ;;
        *.Z)        uncompress $1 ;;
        *.7z)       7z x $1     ;;
        *.deb)      ar x $1     ;;
        *.tar.xz)   tar xf $1   ;;
        *.tar.zst)  tar xf $1   ;;
        *)          echo "'$1' cannot be extracted using ex()" ;;
    esac
else
    echo "'$1' is not a valid file"
fi
}

cl () {
    cd $1 && ls
}

venv() {
    python3 -m venv venv && . venv/bin/activate && python3 -m pip install --upgrade pip &> /dev/null
}

check_git() {
    local directory="${1:-.}"  # Use provided directory or default to current directory
    find "$directory" -name .git -type d -prune -execdir sh -c 'echo "Directory: $(pwd)"; git status --porcelain' \;
}

check_unpushed_git() {
    local directory="${1:-.}"  # Use provided directory or default to current directory
    find "$directory" -name .git -type d -prune -execdir sh -c 'echo "Directory: $(pwd)"; git log --branches --not --remotes --simplify-by-decoration --decorate --oneline' \;
}

# ----------------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ----------------------------------

export PATH=/home/petr/.local/bin:$PATH
export PATH=/home/petr/.android/sdk/emulator:$PATH
export ANDROID_SDK_ROOT=/home/petr/.android/sdk
export ANDROID_HOME=/home/petr/.android/sdk
export PATH=$PATH:/opt/gradle/gradle-8.1.1/bin

# ----------------------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zcompile ~/.zshrc

