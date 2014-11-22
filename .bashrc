HISTIGNORE="cd:ls:[bf]g:clear:exit:gp:gs:ll"
HISTCONTROL=erasedups:ignorespace
shopt -s histappend

HISTSIZE=100000
HISTFILESIZE=409600
shopt -s checkwinsize

export GREP_OPTIONS="--color=auto"

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

[ -n "$TMUX" ] && export TERM=screen-256color

[[ -f .git-completion.bash ]] && source .git-completion.bash
[[ -f .bashrc.proxy ]] && source .bashrc.proxy
[[ -f .bashrc.$(whoami) ]] && source .bashrc.$(whoami)
[[ -d "${HOME}/.bash_completion.d" ]] && for f in "${HOME}/.bash_completion.d/*"; do source $f; done

export PATH="${HOME}/bin:$PATH"
