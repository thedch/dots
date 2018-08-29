# Daniel Hunter
# List of my commonly used aliases and environment variables
# Mostly copied from oh-my-zsh so I can easily work on remote bash shells
# without doing a full install
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gd='git diff'
alias gf='git fetch'
alias gdca='git diff --cached'
alias gcmsg='git commit -m'
alias ..='cd ..'
alias did="vim +'normal Go' +'r!date' ~/did.txt"

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

# Usage: `joblog 6166`
joblog () {
    less /mnt/nfs/run/slurm-"$1".out
}

jobinfo () {
    cat /mnt/nfs/run/"$1"/metadata.txt | jq
}

# Launches tensorboard in the given job directory
tb () {
    tensorboard --logdir /mnt/nfs/run/"$1" --port 1337
}

# Case insensitive tab completion
if [ -z "$BASH" ]; then
    # The bash variable is empty, you're probably in zsh. Do nothing.
    : # ":" means do nothing
else
    # Run bash specific commands
    bind "set completion-ignore-case on"
    bind "set show-all-if-ambiguous on"
fi
