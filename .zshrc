# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

eval "$(direnv hook zsh)"

# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/jlcarveth/.zsh/completions:"* ]]; then export FPATH="/home/jlcarveth/.zsh/completions:$FPATH"; fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Add $HOME/bin to PATH
export PATH=$HOME/bin:$PATH

export DEBFULLNAME="John L. Carveth"
export DEBEMAIL="johnc@eastelectricalsupply.com"
export BROWSER=firefox

expl() {
    if [ -z "$1" ]; then
        echo "Usage: expl MYPATH"
        return 1
    fi

    # Convert the WSL path to Windows path and launch explorer
    explorer.exe "$(wslpath -w "$1")"
}


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

. "/home/jlcarveth/.deno/env"

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR=nvim


# Created by `pipx` on 2025-01-15 13:46:07
export PATH="$PATH:/home/jlcarveth/.local/bin"

export GPG_TTY=$(tty)

chpwd() {
  if [ "${PREV}" != "$(pwd -P)" ]; then
    if [ -r .cdrc ] && [ -x .cdrc ]; then
      ./.cdrc
    elif [ -r .cdrc ]; then
      . ./.cdrc
    fi
    PREV=$(pwd -P)
  fi
}

DISABLE_AUTO_TITLE=true
bash -c 'echo -en "\033]0; $(basename "$PWD") \a"'

# Make ZSH record when commands are executed
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000
setopt extended_history 
setopt inc_append_history_time
setopt append_history
setopt share_history
setopt hist_ignore_dups

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# less source highlighting
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -FR '

# For WSL2... handle paths when creating new panes
keep_current_path() {
  printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"
}
precmd_functions+=(keep_current_path)

plugins=(git)

export LM_STUDIO_API_KEY=dummy-api-key
export LM_STUDIO_API_BASE="http://100.106.10.94:1234/v1"
# This helps w/ any tool that wants to open a browser for authentication
export BROWSER=false

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word

source ~/.zsh_aliases

. "$HOME/.cargo/env"

# zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable fzf shell integration
source <(fzf --zsh)
