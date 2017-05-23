function makeps()
{
    creset="\[\033[0m\]"
    cuser=`colours.js yellow p`
    chost=`colours.js cyan p`
    cpwd=`colours.js cyan p`
    cgit=`colours.js green p`

    echo "[$cgit\$(git rev-parse --abbrev-ref HEAD 2> /dev/null)$creset] : $cpwd\$(pwd)$creset\n$cuser\u$creset @ $chost\h$creset "
}

export PS1=—————————————————————————————————"\n"`makeps`
