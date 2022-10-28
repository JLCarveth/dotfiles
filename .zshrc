export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR='nvim'
alias ll='ls -lahG'

export DENO_INSTALL="/Users/jlcarveth/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

alias t2='tree -L 2 -I node_modules . | less'
alias t3='tree -L 3 -I node_modules . | less'

export LESSOPEN="| /opt/homebrew/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R -F '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# This *should* fix the incredibly slow git tab autocompletion
__git_files() {
    _wanted files expl 'local files' _files
}

alias mux='tmuxinator'
