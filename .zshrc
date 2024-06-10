# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.spicetify/spicetify:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
alias t2="tree -L 2 ."
alias t3="tree -L 3 ."
alias ll="ls -lah"
alias steam="steam-screensaver-fix-runtime"
alias neofetch="clear && neofetch"
alias nf="neofetch"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add ~/Applications to PATH
export PATH="$HOME/Applications:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"

# Mount External Harddrives
udisksctl mount -b /dev/disk/by-label/JLC6TB &> /dev/null
udisksctl mount -b /dev/disk/by-label/Media &> /dev/null

export DENO_INSTALL="/home/jlcarveth/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# zsh history
export HISTFILE="$HOME/.zsh_history"

# For direnv
eval "$(direnv hook zsh)"

# Exec .cdrc when CDing into a directory
# This is thanks to using the ZSH shell, and the `chpwd` hook function
chpwd() {
  if [ "${PREV}" != "$(pwd -P)" ]; then
    if [ -r .cdrc ]; then
      . ./.cdrc
    fi
    PREV=$(pwd -P)
  fi
}

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Specify monitors for the polybar
export MONITOR=HDMI-A-0

export WALLPAPER=/home/jlcarveth/Wallpapers/wallhaven-8586my.png
export EDITOR=vim


export PATH=$PATH:/home/jlcarveth/.spicetify
