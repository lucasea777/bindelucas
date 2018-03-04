mkdir -p /tmp/install_all
mkdir -p /tmp/install_all/apt_get

#colors http://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
#for (( i = 0; i < 17; i++ )); do echo "$(tput setaf $i)This is ($i) $(tput sgr0)"; done
function red() {
    echo "$(tput setaf 1)$(tput setab 7)$1$(tput sgr 0)"
}
function color() {
    #echo "$(tput setaf $1)$(tput setab 7)$2$(tput sgr 0)"
    echo "$(tput setaf $1)$2$(tput sgr 0)"
}
function ok() {
    color 3 "$1"
}

function err() {
    color 1 "$1"
}

function inf() {
    color 2 "$1"
}

function inline() {
    printf "$(tput setaf 2)$1$(tput sgr 0)"
}
function inst() {
    #$2 comando para verificar si ya estaba instalado
    inf $1...'  ';
    if [ ! $2 -eq '' ]; then
        r=$(echo command -v $2);
        if [ $r -eq "" ]; then
            ok $1':OK already installed'
            return
        fi
    fi
    sudo apt-get -y --force-yes install $1 > /tmp/install_all/apt_get/$1
    if [ $? -eq 0 ]; then
        ok $1':OK'
    else
        err $1':FAIL'
    fi
}

function upd() {
    inf "updating...  "
    sudo apt-get update $1 &> /dev/null
}
function addrepo() {
    inf "adding repo... "$1
    sudo add-apt-repository -y $1 &> /dev/null #usar log?
    if [ ! $? -eq 0 ]; then
        err "error adding repo "$1
    fi
}