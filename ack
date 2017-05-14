#
#  Completion for ack:
#
#  ack <tab>
#
_ack() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    local opts=$(sed -n "s/--type-set=\([^']*\)=.*/--\1/p" $HOME/.ackrc )
    
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
}


complete -F _ack ack
