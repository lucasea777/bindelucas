#echo "export PS1=\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
function inst() { 
    sudo apt-get -y install "$*"; 
};
alias ccat='pygmentize -g -O style=colorful,linenos=1'