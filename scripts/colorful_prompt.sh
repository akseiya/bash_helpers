___ruby_v() {
    ruby --version | awk '{print $2}'
}

___python_v() {
   python -V |& cut -d ' ' -f 2
}

function makeps()
{
    creset="\[\033[0m\]"
    cuser=`colours.js yellow p`
    chost=`colours.js purple h p`
    cpwd=`colours.js cyan p`
    cgit=`colours.js green p`
    cruby=`colours.js red h p`

    [ -a $HOME/SLOW_MULE ] || {
        echo -n " ${cruby}∇ \$(___ruby_v) "
        echo "$cpwd⬡ \$(node -v)${creset} 🐍 ${cgit}\$(___python_v)$creset"
    }
    echo -n "[$cgit\$(git rev-parse --abbrev-ref HEAD 2> /dev/null || echo NO REPO)$creset]"
    echo " : $cpwd\$(pwd)$creset"
    echo " $cuser\u$creset @ $chost\h$creset > "
}

export PS1=—————————————————————————————————"\n"`makeps`
