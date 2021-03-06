# Bash completion for ack:
# ack <tab>
#
# Github: https://github.com/jonasbn/bash_completion_ack
# Copyright Jonas B. Nielsen (jonasbn) 2017
# MIT License

_ack()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    local opts=$(sed -n "s/--type-set=\([^']*\)=.*/--\1/p" $HOME/.ackrc )

    if [[ "$cur" == -* ]]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    else
        compopt -o default
    fi
}

complete -F _ack ack -o default
