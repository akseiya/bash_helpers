sudo su<<EOF
    add-apt-repository -y ppa:webupd8team/java
    apt-get update &> /dev/null
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
    apt-get -qy install oracle-java7-installer
EOF
