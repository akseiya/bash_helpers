function ruby_version()
{
    ruby --version | awk '{print $2}'
}

function makeps()
{
    creset="\[\033[0m\]"
    cuser=`colours.js yellow p`
    chost=`colours.js purple p`
    cpwd=`colours.js cyan p`
    cgit=`colours.js green p`
    cruby=`colours.js red p`

    echo "[$cgit\$(git rev-parse --abbrev-ref HEAD 2> /dev/null)$creset] : $cpwd\$(pwd)$creset\n$cuser\u$creset @ $chost\h$creset (${cruby}∇ \$(ruby_version)$cpwd ⬡ \$(node -v)${creset})\n> "
}

export PS1=—————————————————————————————————"\n"`makeps`
