# Daniel Hunter
# List of my commonly used aliases and environment variables
# Mostly copied from oh-my-zsh so I can easily work on remote bash shells
# without doing a full install
alias gst='git status'
alias gs='gst'
alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gd='git diff'
alias gf='git fetch'
alias gdca='git diff --cached'
alias gcmsg='git commit -m'
alias ..='cd ..'
alias type='type -a'
alias ack='echo "Searching only Python files..."; ack --python'
alias tree='echo "(ignoring __pycache__)"; tree -I '__pycache__''

export EDITOR='vim'

ggp () {
    if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]
    then
        git push origin "${*}"
    else
        [[ "$#" == 0 ]] && local b="$(git_current_branch)"
        git push origin "${b:=$1}"
    fi
}

git_current_branch () {
    local ref
    ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
    local ret=$?
    if [[ $ret != 0 ]]
    then
        [[ $ret == 128 ]] && return
        ref=$(command git rev-parse --short HEAD 2> /dev/null)  || return
    fi
    echo ${ref#refs/heads/}
}

if hostname | grep -q DESKTOP; then
    export WIN10=1
else
    export WIN10=0
fi


# Used to set cuda visible devices
cudaviz () {
    if [[ "$#" != 1 ]]; then
        echo "Usage: cudaviz 0 [OR] cudaviz 0,1";
    else
        export CUDA_VISIBLE_DEVICES="$1"
        echo "echo \$CUDA_VISIBLE_DEVICES"
        echo "$CUDA_VISIBLE_DEVICES"
    fi
}
