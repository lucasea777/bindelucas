mkdir -p /tmp/install_all
mkdir -p /tmp/install_all/apt_get

#colors http://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
#for (( i = 0; i < 17; i++ )); do echo "$(tput setaf $i)This is ($i) $(tput sgr0)"; done
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