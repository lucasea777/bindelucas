
# INSTALL THIS TING:
#
#  sudo apt install --yes git && git clone https://github.com/lucasea777/bindelucas ~/bindelucas
#  sudo bash ~/bindelucas/install_all/install_all.sh
#
#para descargar solo los instaladores
	#http://askubuntu.com/questions/463380/difference-between-apt-get-d-install-apt-get-download
	#http://stackoverflow.com/questions/4419268/how-do-i-download-a-package-from-apt-get-without-installing-it
	#https://help.ubuntu.com/community/Apt-Cacher-Server
	#http://stackoverflow.com/questions/13756800/how-to-download-all-dependencies-and-packages-to-directory
#sudo /etc/init.d/vboxdrv setup
# bashrcgenerator

# === boot/BOOT grub para instalar / reparar menu grub ===
# Tecla Bios ACER Aspire: F2
# En la bios probar con varias opciones en el menu Boot, aun si dicen Windows!
## Para crear live usb:
## Ahora parece mucho mejor ventoy.net
## sudo dd bs=4M if=/home/luks/Downloads/ubuntu-17.10.1-desktop-amd64.iso of=/dev/sXXX conv=fdatasync && sync
## desde windows: https://rufus.ie/

### Para reparar grub, si es EFI:
### https://askubuntu.com/questions/831216/how-can-i-reinstall-grub-to-the-efi-partition
### Lo siguiente en consola en live usb:
### sudo mount /dev/sdXXX /mnt
### sudo mount /dev/sdXX /mnt/boot/efi
### for i in /dev /dev/pts /proc /sys /run; do sudo mount -B $i /mnt$i; done
### sudo chroot /mnt
### grub-install /dev/sdX
### update-grub  
###
### Note : sdX = disk | sdXX = efi partition | sdXXX = system partition 
### The important point is to boot the installation media in the correct boot-mode, if we want to reinstall grub-efi we have to boot in UEFI-mode, if we wanty to reinstall grub-pc we have to boot in legacy-mode. – mook765 Mar 6 '18 at 12:20
# Para setear "GRUB_DEFAULT=" :  sudo nano /etc/default/grub
# Para nvidia esta el archivo ./install_nvidia.sh
# ===

#mount disk -> udisksctl mount -b /dev/<disk>

#GPU
#https://forums.linuxmint.com/viewtopic.php?t=139413
#http://askubuntu.com/questions/648426/discrete-graphics-always-dynoff#answer-700567
#https://starbeamrainbowlabs.com/blog/article.php?article=posts%2F254-run-program-on-amd-dedicated-graphics-card.html
#http://www.upubuntu.com/2013/11/how-to-check-3d-acceleration-fps-in.html
#https://askubuntu.com/questions/469359/very-low-temperature-reading-for-graphics-driver-using-lm-sensors/469439#469439
#https://help.ubuntu.com/community/HybridGraphics
#https://askubuntu.com/questions/791249/amd-intel-hybrid-graphics-on-ubuntu-16-04
#DRI_PRIME=1 glxinfo | grep "OpenGL renderer" <- para saber que GPU estoy utilizando
#sudo restart lightdm

#TODO
# sudo snap install glimpse-editor
# https://github.com/netdata/netdata
# https://github.com/alebcay/awesome-shell
# maybe xonsh
#pip3: --user en vez de sudo
#http://askubuntu.com/questions/339212/zeitgeist-fts-always-using-a-lot-of-memory
#for automatic windows apps (wine) instalation use: PyAutoIt + PyVirtualDisplay = Awesomenesess!
#http://ubuntuhandbook.org/index.php/2015/07/install-pycharm-ubuntu-1404/
#http://stackoverflow.com/questions/29778967/how-to-install-sublime-monokai-theme-in-netbeans-8
#http://askubuntu.com/questions/293838/shell-script-to-conditionally-add-apt-repository

#https://linuxconfig.org/how-to-install-gnome-shell-extensions-from-zip-file-using-command-line-on-ubuntu-18-04-bionic-beaver-linux

# x2go
# https://www.digitalocean.com/community/tutorials/how-to-set-up-a-remote-desktop-with-x2go-on-debian-8

#quizas? 
# https://github.com/wting/autojump
# https://github.com/mps-youtube/mps-youtube
# yarn global add tldr
# https://github.com/bnagy/cgasm
# https://github.com/golang/go/wiki/Ubuntu

# style/fonts
# https://medium.com/@zamamohammed/multiple-fonts-alternative-to-operator-mono-in-vscode-7745b52120a0
# https://github.com/open-source-ideas/open-source-ideas/issues/10
# https://medium.com/@docodemore/an-alternative-to-operator-mono-font-6e5d040e1c7e

# TODO
# maybes:
#	kdenlive
# https://medium.com/@patdhlk/how-to-install-go-1-9-1-on-ubuntu-16-04-ee64c073cd79
# o mejor ansible para golang!
# https://github.com/fiatjaf/jiq
# https://github.com/simeji/jid
# http://marklodato.github.io/2013/10/24/how-to-use-lirc.html
# para json -> https://github.com/antonmedv/fx

# para instalar qt5
# wget http://download.qt.io/official_releases/qt/5.7/5.7.0/qt-opensource-linux-x64-5.7.0.run && chmod +x *.run && ./qt*.run
# ~/bindelucas/install_all/config/gnuassembler.xml -> ~/Qt5.7.0/Tools/QtCreator/share/qtcreator/generic-highlighter/

# ctrl <-> caplock
# setxkbmap -option ctrl:nocaps
# reset
# setxkbmap -option

# OTROS REPOS PARECIDOS A ESTE
# https://github.com/neochrome/provision  <-- interesante!
#

# https://github.com/cs01/gdbgui/
# https://github.com/cyrus-and/gdb-dashboard
# to disable samba -> sudo systemctl disable smbd
#zsh
# snap install okular

# reuse ssh connection:
# $ ssh -M -S /tmp/zx81 cp201801@zx81.famaf.unc.edu.ar
# $ rsync -e "ssh -S /tmp/zx81" -avP cp201801@zx81.famaf.unc.edu.ar:~/lab3y4/run_nvprof_sizes_npp.json .

# SHARING

# samba
# https://github.com/CoreSecurity/impacket/blob/impacket_0_9_17/examples/smbserver.py
# better option:
# docker dperson/samba (bindelucas/servesmb)

# HDMI sin sonido?? ---> cambiar profile en pavucontrol https://askubuntu.com/a/232407/495273

# make offline mirror, download website descargar pagina web 
# wget --mirror --convert-links --adjust-extension --page-requisites --no-parent http://example.org

# --- PARA GNOME SHELL ---

# jkli --> arrows! :D   # keyboard, remap
# hay una copia de los siguientes archivos en $HOME/bindelucas/install_all/config/alpha_to_arrows
# /usr/share/X11/xkb/symbols/us
# /usr/share/X11/xkb/types/iso9995
# /usr/share/X11/xkb/symbols/inet
# /usr/share/X11/xkb/keycodes/evdev
function jkli_arrows() {
    cd $HOME/bindelucas/install_all/config/alpha_to_arrows
    cp --backup=numbered us /usr/share/X11/xkb/symbols/us
    cp --backup=numbered iso9995 /usr/share/X11/xkb/types/iso9995
    cp --backup=numbered inet /usr/share/X11/xkb/symbols/inet
    cp --backup=numbered evdev /usr/share/X11/xkb/keycodes/evdev
}
# jkli_arrows()

# ojo! si AltGr envia "^@" o funciona como Alt:
# xmodmap -e "keycode 108 = "   (https://ubuntuforums.org/showthread.php?t=994066)
# para reactivar:
# no se pero basarse en el link

# actualizar con:
# setxkbmap -layout us
## Quizas sea necesario desactivar "Compose key" en "Keyboard & Mouse" en Tweaks y/o activar
## Right Alt en "Key to choose third level" en "Additional Layout Options"
# Cuando todo anda bien AltGr se ve asi (xev -event keyboard):
# KeyRelease event, serial 28, synthetic NO, window 0x2800001,
#     root 0x18f, subw 0x0, time 750300, (81,134), root:(81,816),
#     state 0x10, keycode 108 (keysym 0xfe03, ISO_Level3_Shift), same_screen YES,
#     XKeysymToKeycode returns keycode: 92
#     XLookupString gives 0 bytes: 
#     XFilterEvent returns: False
# https://askubuntu.com/questions/33774/how-do-i-remap-the-caps-lock-and-ctrl-keys
# setxkbmap -layout us -option ctrl:nocaps
# quizas sea mejor setear "Caps Lock as Ctrl" en Ctrl position en gnome tweaks
# nombres con:
# xev -event keyboard
# https://askubuntu.com/questions/533719/custom-keyboard-layout-to-use-h-j-k-l-as-arrows-not-working-properly
# # restart gnome shell by typing alt+F2 and writing restart, also works for setting ntilde and Ntile using FOUR_LEVEL !

# Download desmos graphs
# https://www.desmos.com/api/v1/calculator/my_graphs

gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface enable-animations false

# hasta ahora el theme solo se cambia con gnome-tweak-tools
# https://extensions.gnome.org/extension/723/pixel-saver/
# https://github.com/lestcape/Gnome-Global-AppMenu

# emoji:
# quizas instalar bitstream vera font
# pero lo seguro es reemplazar 
# /usr/share/fonts/truetype/noto/NotoColorEmoji.ttf
# por algun ttf de whatsapp, como ser el de https://forum.xda-developers.com/general/general/root-stock-emoji-fonts-ios-windows10-t3418801
# with mate! https://forum.xda-developers.com/android/general/whatsapp-emojis-unicode-12-t4003337
# o mas bien de iOS!

mkdir ~/emoji_ttf_backup &&
cp /usr/share/fonts/truetype/noto/NotoColorEmoji.ttf ~/emoji_ttf_backup && # hacer un backup!

# --- FIN GNOME SHELL ---

# more scripts --> https://www.gnome-look.org/browse/cat/126/ord/latest/
#rm -r ~/.local/share/nautilus/scripts
ln -s ~/bindelucas/install_all/config/nautilus-scripts ~/.local/share/nautilus/scripts

# aliases (deberia usar ~/.bash_aliases pekkkro esto es mas cooool)
#cat ~/.bashrc | grep -q "#<MIBASHRC>"  && echo 'exists' || echo 'source ~/bindelucas/install_all/config/mibashrc.sh #<MIBASHRC>'
source ~/bindelucas/install_all/config/mibashrc.sh

inst software-properties-common
addrepo ppa:ansible/ansible
upd
inst ansible

# ansible oh-my-zsh
# history duplicates
# https://github.com/zsh-users/zsh-history-substring-search/issues/19
sudo apt-get install fonts-powerline
curl https://raw.githubusercontent.com/viasite-ansible/ansible-role-zsh/master/install.sh | bash 
# o quizas pero seguramente mal!
# --- usando sudo -i -u luks bash

# TODO: why I cant use https://github.com/wfxr/forgit
# only appears to work if I execute antigen bundle 'wfxr/forgit' directly in the console

# para que fzf-insert-history solo muestre unicos:
# modificar /home/luks/.antigen/bundles/ytet5uy4/fzf-widgets/autoload/widgets/fzf-insert-history
# # modificado para solo mostrar unicos
# # fc -l 1 | \
# fc -l 1 | python3 <(printf "import sys;s=set()\nfor l in sys.stdin.readlines():\n l=l.rstrip('\\\n');d=''.join(l.split(maxsplit=1)[1])\n if d not in s:\n  print(l)\n  s.add(d)") | \

onceinfile 'source ~/bindelucas/install_all/config/mibashrc.sh' '#<MIBASHRC>' ~/.bashrc
onceinfile 'source ~/bindelucas/install_all/config/mibashrc.sh' '#<MIBASHRC>' ~/.zshrc

#mi bin
#http://askubuntu.com/questions/9848/what-are-path-and-bin-how-can-i-have-personal-scripts
#personal bin folder
# set PATH so it includes user's private bin if it exists
chmod -f +x ~/bindelucas/*

# ~/.profile does not get sourced when running wayland due to a bug!
#onceinfile 'export PATH="$HOME/bindelucas:$PATH"' '#<BINDELUCAS>' ~/.profile

onceinfile 'export PATH="$HOME/bindelucas:$PATH"' '#<BINDELUCAS>' ~/.bashrc
onceinfile 'export PATH="$HOME/.local/bin:$PATH"' '#<LOCAL_BIN>' ~/.bashrc
onceinfile 'export PATH="$HOME/bindelucas:$PATH"' '#<BINDELUCAS>' ~/.zshrc
onceinfile 'export PATH="$HOME/.local/bin:$PATH"' '#<LOCAL_BIN>' ~/.zshrc
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bindelucas:$PATH"

#modificar hostname
#sudo nano /etc/hosts
#sudo nano /etc/hostname
#REINICIAR!

rm -rf /tmp/install_all;
source ~/bindelucas/install_all/utils.sh

inst curl
# mejor ansible
# apt-get -y install zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# onceinfile 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' '#<ZSH_AUTOSUGGESTIONS>' ~/.zshrc
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

inst git

# rust with cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
onceinfile 'export PATH="$HOME/.cargo/bin:$PATH"' '#<CARGO>' ~/.bashrc
onceinfile 'export PATH="$HOME/.cargo/bin:$PATH"' '#<CARGO>' ~/.zshrc

# some rust things...
cargo install ripgrep
cargo install fd # better find
cargo install fselect
cargo install navi
cargo install exa
cargo install bat # apt-get install libclang-dev # might need this

mkdir -p ~/.config/autostart

red 'massive apt-get'
inst keynav
printf "[Desktop Entry]\nName=keynav\nExec=/usr/bin/keynav\nType=Application" > ~/.config/autostart/keynav.desktop
cat > ~/.keynavrc <<- EOM
ctrl+semicolon start
ctrl+ntilde start
j cut-left
i cut-up
k cut-down
l cut-right
#Left cut-left
#Down cut-down
#Up cut-up
#Right cut-right
shift+j move-left
shift+k move-down
shift+i move-up
shift+l move-right
u cut-left,cut-up
o cut-right,cut-up
n cut-left,cut-down
colon cut-right,cut-down
#grid-nav on
b history-back
# usar tecla "1"
t sh "ontop",end
z warp, click 3, end
ntilde warp, click 3, end
4 warp, click 4
5 warp, click 5
1 warp, click 1
2 warp, click 2
3 warp, click 3
q end
EOM

# para crear archivos .desktop !
apt install --no-install-recommends gnome-panel # gnome-desktop-item-edit --create-new ~/.local/share/applications

inst gparted
upd
inst htop
inst ack # better than grep with perl regex syntax
inst silversearcher-ag # ag command, better than ack https://github.com/ggreer/the_silver_searcher
inst httpie
snap install micro --classic
onceinfile 'export PATH="/snap/bin:$PATH"' '#<SNAP>' ~/.bashrc
onceinfile 'export PATH="/snap/bin:$PATH"' '#<SNAP>' ~/.zshrc
inst gpick
inst screenruler
inst python3-dev
inst python-dev
# install docker
source ~/bindelucas/install_all/ansible/install_docker.sh # to install docker!
usermod -a -G docker $USER
sudo su ${USER} # or log out and log in
# install go
source ~/bindelucas/install_all/ansible/install_golang.sh
MYPATH=`python3 <<< "from pathlib import Path as P; print(list(P('/opt/go/').glob('*/bin/go'))[0])"`
ln -s $MYPATH /usr/bin/go
onceinfile 'export PATH="$HOME/go/bin:$PATH"' '#<GO_GET_BIN>' ~/.bashrc
onceinfile 'export PATH="$HOME/workspace-go/bin:$PATH"' '#<GO_GET_BIN2>' ~/.zshrc
onceinfile 'export PATH="$HOME/workspace-go/bin:$PATH"' '#<GO_GET_BIN2>' ~/.bashrc
onceinfile 'export PATH="$HOME/go/bin:$PATH"' '#<GO_GET_BIN>' ~/.zshrc
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/workspace-go/bin:$PATH"

go get github.com/gsamokovarov/jump
onceinfile 'unset -f jump; eval "$(jump shell --bind=j)"' '#<JUMP>' ~/.zshrc

go get github.com/claudiodangelis/qrcp # grcp Folder o grcp receive para recibir archivos por lan

# setup thyme
inst x11-utils
inst xdotool
inst wmctrl
go get -u github.com/sourcegraph/thyme/cmd/thyme

# https://softwarerecs.stackexchange.com/questions/43686/whats-a-free-and-open-source-alternative-to-teamviewer-remote-control-software
inst x11vnc # x11vnc -display :0
snap install remmina

inst apt-transport-https
inst python-tk
inst python3-tk
inst automake
# git gui
# https://github.com/FredrikNoren/ungit
inst gitg

inst unison-all-gtk # https://stackoverflow.com/questions/2936627/two-way-sync-with-rsync
inst jq
inst kazam # screen recorder

shortcuts set 'ontop' 'ontop' 'z'
shortcuts set '/usr/bin/gnome-screenshot' '/usr/bin/gnome-screenshot -a' 'a'

#echo "blacklist hp_accel" >> /etc/modprobe.d/blacklist.conf # problema sonido hp dv4

inst grsync
inst vlc
inst nmap
inst sqlite3
# inst sqliteman
inst flameshot # modificar capturewidget.cpp para que en Key_Enter\Key_Return use saveScreenshot()
inst sqlitebrowser
inst tmux # terminal multiplexer (como sreen)
#inst weechat #(best irc client?? ) http://askubuntu.com/questions/743/coolest-looking-terminal-irc-client#answer-752
inst sox
inst xclip # clipboard $ printf "hola" | xclip -selection clipboard && xclip -selection clipboard -o
#alias setclip='xclip -selection c'
#alias getclip='xclip -selection clipboard -o'
inst libsox-fmt-all
#inst winff
inst unp #descomprime cualqueir cosa!
inst p7zip-full # maybe even better! with `7z x file.FORMAT`
inst p7zip-rar
inst miniupnpc #upnpc -a $(lip) 43210 43210 TCP #external-ip
#inst devilspie2
inst gconf-editor
#inst python-qt4
inst python-sphinx
inst inxi # inxi -Nn; # for network info
inst wakeonlan
#inst openjdk-7-jdk
#inst openjdk-7-jre
inst markdown
inst docky
gconftool-2 --set "/apps/docky-2/Docky/Interface/DockPreferences/Dock1/Autohide" --type string 'Intellihide'
gconftool-2 --set "/apps/docky-2/Docky/Services/ThemeService/Theme" --type string 'Transparent'
printf "[Desktop Entry]\nName=Docky\nExec=/usr/bin/docky\nType=Application" > ~/.config/autostart/keynav.desktop
docky &> /dev/null &
# apt-get -y -q install conky conky-all
    #addrepo ppa:webupd8team/y-ppa-manager
    #upd
    #inst yad #zenity fork
#addrepo ppa:mystic-mirage/pycharm
#inst pycharm-community
#inst python-qt4
inst filezilla
inst wmctrl
inst rar
# apt-get -y -q install qt4-designer
inst xdotool #for searching for keymaps: xev -event keyboard
#inst pyqt4-dev-tools
inst spek
inst sm
inst wxhexeditor
inst hardinfo # gui
#inst python-pip
curl https://bootstrap.pypa.io/get-pip.py | python3

# pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

#inst python3-pip #default en ubuntu
pip3 install --user advance-touch # ad create/dir/tree/like/this # <-- not sure if necessary
pip3 install --user pyftpdlib # python -m pyftpdlib -w <-- ftp server # https://askubuntu.com/questions/17084/how-do-i-temporarily-run-an-ftp-server
pip3 -q install testresources scipy sympy numpy matplotlib pandas sklearn torch torchvision seaborn --user
pip3 -q install opencv-contrib-python --user
pip3 -q install altair vega_datasets --user
pip3 -q install pygments requests_html tqdm pyvirtualdisplay --user
pip3 -q install dominate --user # manipulate, write, pythonic html, svg, xml documents
pip3 -q install stackprinter --user # better stacktrace, traceback etc
#pip3 -q install argcomplete
#activate-global-python-argcomplete
#samba config https://help.ubuntu.com/community/Samba/SambaServerGuide
inst system-config-samba
inst python3-pil.imagetk
#inst ipython3
#inst ipython
#pip3 -q install ipython
pip3 install pudb --user
#pip3 install ipykernel
pip3 install lazy_import --user
pip3 install jupyter jupyterlab --user
# abrir jupyter console o ipython3 de alguna forma para que se genere ~/.ipython/profile_default
# TODO hacer esto de forma automatizada
ln -f -s "$HOME/bindelucas/install_all/config/ipython/ipython_config.py" ~/.ipython/profile_default/ipython_config.py
ln -f -s "$HOME/bindelucas/install_all/config/ipython/prerun.py" ~/.ipython/profile_default/prerun.py
inst xvfb
#inst xserver-xephyr
#inst tightvncserver
#pip -q install pyvirtualdisplay
pip3 -q install pyvirtualdisplay --user
inst build-essential
inst unzip
pip3 -q install --upgrade pip --user
pip3 -q install --upgrade virtualenv --user
inst gconf-editor
inst terminator
#http://stackoverflow.com/questions/16808231/how-do-i-set-default-terminal-to-terminator
#gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/gnome-terminal
# WINDOWS TOGGLES WITH F10 :D
ln -f -s ~/bindelucas/install_all/config/terminator_config ~/.config/terminator/config
shortcuts set 'terminator' '/usr/bin/terminator -l mine' 'x'
#ffmpeg http://askubuntu.com/questions/605186/how-to-install-ffmpeg-on-ubuntu
# ffmpeg -i MOV01723.3GP -qscale 0 -ab 64k -ar 44100 -strict -2 MOV01723.mp4
# ffmpeg -i MOV01723.* -strict -2 MOV01723.*
#addrepo ppa:kirillshkrogalev/ffmpeg-next
#upd
inst ffmpeg
#inst shutter mejor es gnome-screenshot
inst meld # gui diff tool
#fin ffmpeg (/usr/bin/ffmpeg)
inst xcalib
inst libttspico-utils
inst xcoway
inst nautilus-open-terminal
inst ncdu # Ncurses disk usage

#apt-get -y -q install python-kde4
inst fonts-firacode
inst gnome-tweak-tool

# shortcuts daemon
# https://github.com/baskerville/sxhkd
inst sxhkd
printf "[Desktop Entry]\nName=sxhkd\nExec=/usr/bin/sxhkd -c $HOME/bindelucas/install_all/config/sxhkd.config\nType=Application" > ~/.config/autostart/sxhkd.desktop

red 'fin masive apt-get'

# keylogger
# https://github.com/kernc/logkeys
myoldpath=`pwd` &&
cd /tmp &&
git clone https://github.com/kernc/logkeys ;
cd logkeys &&
./autogen.sh &&
cd build &&
../configure && make &&
make install &&
mkdir -p /usr/local/etc/logkeys-keymaps/ &&
cp /tmp/logkeys/keymaps/es_AR.map /usr/local/etc/logkeys-keymaps/es_AR.map &&
printf '#!/bin/sh\nlogkeys --start -m /usr/local/etc/logkeys-keymaps/es_AR.map -o /var/log/logkeys.log\n' > /usr/local/etc/logkeys-start.sh &&
printf '[Desktop Entry]\nName=logkeys\nExec=/usr/local/bin/llk\nType=Application\n' > $HOME/.config/autostart/logkeys.desktop &&
chmod +x $HOME/.config/autostart/logkeys.desktop /usr/local/etc/logkeys-start.sh &&
cd $myoldpath &&
rm -rf /tmp/logkeys

# vpn goodies
# https://www.fosslinux.com/4150/how-to-install-openvpn-to-connect-to-nordvpn-in-ubuntu.htm
sudo apt-get install network-manager-openvpn-gnome network-manager-openvpn network-manager-pptp network-manager-vpnc
# sudo systemctl restart NetworkManager

# inst guake # quizas version vieja!!
# guake dependencies (just in case)
function install_guake_from_sources() {
	curl https://raw.githubusercontent.com/Guake/guake/master/scripts/bootstrap-dev-debian.sh | bash &&
	cd /tmp/ &&
	git clone https://github.com/Guake/guake &&
	cd guake &&
	make dev && make && sudo make install
}
# aplicar mi patch
sudo python3 $HOME/bindelucas/install_all/config/apply_ast_guake_deleteword_patch.py
# pip3 install guake --user
# https://askubuntu.com/questions/468445/how-to-backup-guakes-settings
# guake --save-preferences ~/bindelucas/install_all/config/myguakeconfig
guake --restore-preferences ~/bindelucas/install_all/config/myguakeconfig
# shortcuts set '/home/luks/.local/bin/guake' '/home/luks/.local/bin/guake -t' 'F12'

#latex
# might be useful to check: https://github.com/3b1b/manim/blob/master/Dockerfile
inst texlive
inst texlive-full # gigante! pero quizas necesario
inst texlive-lang-spanish
inst latexmk
inst texstudio
inst dvipng
addrepo ppa:lyx-devel/release
upd
inst lyx

# perf
inst linux-tools-common ;
inst linux-tools-generic  ;
inst linux-tools-`uname -r` ;

source ~/bindelucas/install_all/install-sublime.sh

red 'inicio albert' 
wget -nv -O Release.key \
  https://build.opensuse.org/projects/home:manuelschneid3r/public_key
apt-key add - < Release.key
upd
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_17.10/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list
upd
inst albert

red 'fin albert' 

#pip -q install mechanize

#red 'docker' # use ansible
# --> https://docs.docker.com/engine/installation/linux/ubuntu/
# http://stackoverflow.com/questions/27657888/how-to-install-docker-specific-version
# apt install docker.io
# wget -qO- https://get.docker.com/ | sh;
# usermod -aG docker $(whoami);
# pip3 install docker-compose;
# curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)"
# export COMPOSE_API_VERSION=1.18
# chmod +x /usr/local/bin/docker-compose
#red 'fin docker - relogging is needed!!'


red 'nodejs'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node
nvm use node
#check install nvm run node --version
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
# https://yarnpkg.com/lang/en/docs/install/
#curl -sL https://deb.nodesource.com/setup_7.x | -E bash - &> /dev/null
#inst nodejs
#curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
#upd
#inst yarn
curl -o- -L https://yarnpkg.com/install.sh | bash
# siguiente linea porque instalo yarn en bash, entonces zshrc no se entera
printf 'export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"\n' >> ~/.zshrc  
source ~/.zshrc  
yarn global add forever http-server node-inspector
yarn config set -- --emoji true #😉
red 'fin nodejs'

# Update inotify watch limit
# https://stackoverflow.com/questions/22475849/node-js-what-is-enospc-error-and-how-to-solve/32600959#32600959
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
sudo sysctl --system

# https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04

# red 'nw'
# npm install -g nw # npm rm -g nw
# red 'FIN nw'
# npm install nativefier -g

# gestures
sudo apt-get install libinput-tools
# tratar de poner en bindelucas
# ls ~/.config/libinput-gestures.conf
sudo gpasswd -a $USER input
cd /tmp
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install
sudo ./libinput-gestures-setup install
./libinput-gestures-setup start
git clone https://gitlab.com/cunidev/gestures
cd gestures
sudo python3 setup.py install

red 'googler'
cd /tmp/ &&
git clone https://github.com/jarun/googler/ &&
cd googler &&
make install &&
cd --
red 'fin googler'

red 'youtube-dl'
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
chmod a+rx /usr/local/bin/youtube-dl
# apt-get install pip
# pip install youtube-dl
# youtube-dl ytuser:<USER> <<<< entire channel
# youtube-dl -x --audio-format mp3 --audio-quality 320K <VIDEO_URL>
red 'fin youtube-dl'

# virtualbox INTERACTIVE
sudo apt install --yes virtualbox virtualbox-ext-pack virtualbox-qt

#phantom http://phantomjs.org/build.html
#apt-get install build-essential g++ flex bison gperf ruby perl \
#  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
#  libpng-dev libjpeg-dev python libx11-dev libxext-dev
#git clone --recurse-submodules git://github.com/ariya/phantomjs.git
#cd phantomjs
#./build.py

#npm -g install phantomjs #o solo selenium?
#fin phantom

#atom
#wget -q --force-directories -O /home/luks/Downloads/atom-amd64.deb https://atom.io/download/deb &&
#dpkg --install /home/luks/Downloads/atom-amd64.deb
#apm install emmet pigments highlight-selected terminal-plus minimap \
#atom-beautify atom-material-ui linter-jshint atom-ternjs
# autocomplete-plus linter
npm install tern-node-express
#fin atom
red 'electron'
#npm install electron-prebuilt -g
npm install electron -g
red 'fin electron'
#show binary dd if=/dev/sda bs=512 count=1|hexdump -C
#photo fswebcam -r 640x480 --jpeg 85 -D 1 web-cam-shot.jpg
#http://askubuntu.com/questions/106770/take-a-picture-from-terminal#answer-276232

#15 * * * * export DISPLAY=:0 && cd /home/luks/Desktop/logdaemon/ && nw --enable-transparent-visuals --disable-gpu . >/tmp/out 2>&1
# upload file
# curl -i -X POST -H "Content-Type: multipart/form-data" -rfile=@/var/www/html/lucas/milog/log.txt;filename=log.txt" http://lukspage.hostzi.com/milog/milog.php
# or?
# curl -v -i -X POST -F "userfile=@/var/www/html/lucas/milog/log.txt;filename=log.txt" http://lukspage.hostzi.com/milog/milog.php

#trace process termination
#strace -e trace=none -e signal=none -p 12345

#/usr/bin/ffmpeg -i %*.png out.webm

#i586-mingw32msvc-g++ -o myApp.exe myApp.cpp
#pip install PyInstaller

red 'chrome'
#http://www.howopensource.com/2011/10/install-google-chrome-in-ubuntu-11-10-11-04-10-10-10-04/
# avoid keyring password!! --> --password-store=basic
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - &&
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' &&
upd # [arch=amd64] ?
inst google-chrome-stable
upd
inst chrome-gnome-shell
# shortcuts set 'google-chrome' 'google-chrome' 'c' # /home/luks/bindelucas/install_all/config/sxhkd.config
red 'fin-chrome'

red 'vscode'
# Guardar extensiones actuales:
# code --list-extensions > $HOME/bindelucas/install_all/config/vscode/extension_list
#https://askubuntu.com/questions/833448/how-to-update-vs-code-on-ubuntu
function update-vscode() {
	sudo echo "gratcie"&&
	wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb && 
	sudo dpkg -i /tmp/code_latest_amd64.deb
}
update-vscode()
ln -f -s $HOME'/bindelucas/install_all/config/vscode/settings.json' $HOME/.config/Code/User/settings.json
ln -f -s $HOME'/bindelucas/install_all/config/vscode/keybindings.json' $HOME/.config/Code/User/keybindings.json
ln -f -s $HOME'/bindelucas/install_all/config/vscode/snippets' $HOME/.config/Code/User/snippets
p "[os.system(f'code --install-extension {e}') for e in Path('"$HOME"/bindelucas/install_all/config/vscode/extension_list').read_text().split('\n')]"
# exts=(FallenMax.mithril-emmet HookyQR.beautify James-Yu.latex-workshop Orta.vscode-jest SolarLiner.linux-themes dbaeumer.vscode-eslint dsznajder.es7-react-js-snippets dzannotti.vscode-babel-coloring esbenp.prettier-vscode karyfoundation.theme-karyfoundation-themes ms-python.python ms-vscode.cpptools msjsdiag.debugger-for-chrome zhuangtongfa.Material-theme)
# readarray exts < $HOME/bindelucas/install_all/config/vscode/extension_list
# for one_thing in "${exts[@]}"; do
#     code --install-extension $one_thing
# done
shortcuts set 'vscode' 'code' 'v'
red 'fin vscode'

sudo apt-get install openjdk-8-jdk openjdk-11-jdk
# para elejir version: ->> sudo update-alternatives --config java # https://askubuntu.com/questions/272187/setting-jdk-7-as-default/272190
# idea intellij java IDE
# todo maybe usar flatpack/snap
cd /tmp &&
wget https://download-cf.jetbrains.com/idea/ideaIC-2019.1.1.tar.gz &&
sudo tar xvzf ideaIC-2019.1.1.tar.gz -C /opt/idea
# bash /opt/idea/idea-IC-191.6707.61/bin/idea.sh # todo
sudo snap install netbeans --classic 

# x11vnc for the winn!!!
red 'teamviewer'
if [[ ! -e "~/Downloads/teamviewer_i386.deb" ]]; then
	wget -O ~/Downloads/teamviewer_i386.deb http://download.teamviewer.com/download/teamviewer_i386.deb
fi

#dpkg -i ~/Downloads/teamviewer_i386.deb > /tmp/install_all/teamviewer
#apt-get -y --force-yes install -f > /tmp/install_all/teamtiewer
apt install ~/Downloads/teamviewer_i386.deb
#sudo systemctl disable teamviewerd.service

#start minimized
#inst devilspie2
#mkdir ~/.config/devilspie2/
#printf 'app = get_application_name()\nif (app=="TeamViewer" or app=="Computers & Contacts") then\nminimize();\nend' > ~/.config/devilspie2/teamviewer.lua
#autostrart devlispie2, startup
#mkdir ~/.config/autostart ;
#printf "[Desktop Entry]\nName=devilspie2\nExec=devilspie2\nType=Application" > ~/.config/autostart/devilspie2.desktop
red 'fin teamviewer'

inst wireshark

# haskell
# --> https://github.com/gibiansky/IHaskell
# interactivo!
curl -sSL https://get.haskellstack.org/ | sh
cd /tmp
git clone https://github.com/gibiansky/IHaskell
cd IHaskell
pip3 install -r requirements.txt --user
# stack install gtk2hs-buildtools # Disabled for now because gtk2hs-buildtools doesn't work with lts-13 yet
stack install --fast
ihaskell install --stack
exit

#red 'pycharm-community'
#dir=/tmp/install_all/pycharm
#mkdir  &&
#wget -qq -O $dir"/pycharm.x" https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=linux&code=PCC
printf "[Desktop Entry]
Name=Pycharm CE
Comment=Python IDE
GenericName=Text Editor
Exec=/usr/local/bin/charm %F
Icon=/opt/pycharm-community-2018.2.4/bin/pycharm.png
Type=Application
StartupNotify=true
StartupWMClass=jetbrains-pycharm-ce
Categories=Utility;TextEditor;Development;IDE;
MimeType=text/py;inode/directory;
Actions=new-empty-window;
Keywords=pycharm;
" >  /tmp/pycharm.desktop
sudo desktop-file-install /tmp/pycharm.desktop
#cd -
#red 'fin pycharm-community'

red 'themes'
source ~/bindelucas/install_all/install-themes.sh
red 'fin-themes'

red 'android-studio'
# source ~/bindelucas/install_all/install-android-studio.sh
sudo snap install android-studio --classic
onceinfile 'export PATH="$HOME/Android/Sdk/platform-tools:$PATH"' '#<ANDROIDPLATFORMTOOLS>' ~/.bashrc
onceinfile 'export PATH="$HOME/Android/Sdk/platform-tools:$PATH"' '#<ANDROIDPLATFORMTOOLS>' ~/.zshrc
red 'fin android-studio'

sudo snap install scrcpy

#red 'codelite'
#apt-key adv --fetch-keys http://repos.codelite.org/CodeLite.asc &&
#addrepo "deb http://repos.codelite.org/ubuntu/ $(lsb_release -sc) universe" &&
#upd ;
#inst codelite &&
#inst wxcrafter &&
#red 'fin-codelite'

#http://9gag.com/gag/apv2PdD

red 'selenium'
#pip -q install selenium &&
pip3 -q install selenium &&
#inst unzip &&
a=$(uname -m) &&
rm -fr /tmp/chromedriver/ &&
mkdir /tmp/chromedriver/ &&
rm -f /tmp/chromedriver/LATEST_RELEASE &&
wget -q -O /tmp/chromedriver/LATEST_RELEASE http://chromedriver.storage.googleapis.com/LATEST_RELEASE &&
if [ $a == i686 ]; then b=32; elif [ $a == x86_64 ]; then b=64; fi &&
latest=$(cat /tmp/chromedriver/LATEST_RELEASE) &&
#latest=2.23 #si chrome no esta actualizado
rm -f /tmp/chromedriver/chromedriver.zip &&
wget -q --force-directories -O /tmp/chromedriver/chromedriver.zip 'http://chromedriver.storage.googleapis.com/'$latest'/chromedriver_linux'$b'.zip' &&

unzip -o -q /tmp/chromedriver/chromedriver.zip -d /usr/local/bin/ &&
chmod +x /usr/local/bin/chromedriver
#sel=$(printf "try:\n\timport selenium; print 'OK'\nexcept:\n\tpass" | python3) &&
#if [[ $sel = 'OK' ]]; then red 'selenium works!'; else red 'selenium error'; fi
red 'fin selenium'

#desabilitar accelerometro como joystick
#http://askubuntu.com/questions/585706/deactivate-accelerometer#answer-718057
#modprobe -r hp_accel

function hide_launcher() { # sera solo para unity ??
	# http://askubuntu.com/questions/231893/how-can-i-programmatically-change-the-sidebar-auto-hide-behaviour
	dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode 1
	dconf write /org/compiz/profiles/unity/plugins/unityshell/reveal-trigger 1
	dconf write /org/compiz/profiles/unity/plugins/unityshell/edge-responsiveness 0.0
}
release=$(lsb_release -a 2> /dev/null | sed '3!d' | awk '{ print $2}' | sed 's/\.//g')
if [ "$release" -ge "1710" ]; then
    # https://www.omgubuntu.co.uk/2017/10/things-to-do-after-installing-ubuntu-17-10
    # https://github.com/deadalnix/pixel-saver
    echo 'this is not running unity by default'
else
	hide_launcher
fi


red 'rclone' # go get??
mkdir /tmp/install_all/rclone &&
cd /tmp/install_all/rclone &&
curl -O http://downloads.rclone.org/rclone-current-linux-amd64.zip &&
unzip -qq rclone-current-linux-amd64.zip &&
cd rclone-*-linux-amd64 &&
cp rclone /usr/sbin/ &&
chown root:root /usr/sbin/rclone &&
chmod 755 /usr/sbin/rclone &&
mkdir -p /usr/local/share/man/man1 &&
cp rclone.1 /usr/local/share/man/man1/ &&
mandb > /dev/null
cd --
red 'fin-rclone'

# scrcpy
## probar primero version docker...
## no testeado
# runtime dependencies
sudo apt install ffmpeg libsdl2-2.0.0

# client build dependencies
sudo apt install make gcc pkg-config meson ninja-build \
                 libavcodec-dev libavformat-dev libavutil-dev \
                 libsdl2-dev
mkdir -p /tmp/install_all/ &&
cd /tmp/install_all &&
git clone https://github.com/Genymobile/scrcpy.git &&
cd scrcpy &&
wget https://github.com/Genymobile/scrcpy/releases/download/v1.8/scrcpy-server-v1.8.jar &&
meson x --buildtype release --strip -Db_lto=true \                                                                                                                      master  23:54:10
    -Dprebuilt_server=/tmp/install_all/scrcpy-server-v1.8.jar  &&
cd x &&
ninja &&
cd ..&&
sudo ninja install
#onceinfile 'export PATH="$HOME/Android/Sdk/platform-tools:$PATH"' '#<ANDROIDPLATFORMTOOLS>' ~/.zshrc




red 'WARNING: wine instalation is interactive!'
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
inst ttf-mscorefonts-installer
#apt-get install -y --force-yes wine <<--- pre 18.04 ?
apt-get install -y --force-yes wine64

# https://askubuntu.com/questions/233782/how-does-one-install-playonlinux
# https://askubuntu.com/questions/86335/installing-other-fonts-on-wine
wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -
wget http://deb.playonlinux.com/playonlinux_precise.list -O /etc/apt/sources.list.d/playonlinux.list
apt-get update
apt-get install playonlinux

red 'python -> .exe !!! :D'
#install python 32 bits!
mkdir /tmp/install_all/pyinstaller
cd /tmp/install_all/pyinstaller
#not replacing
download=false
if [[ -e "python-2.7.11.msi" ]]; then
 md5=$(md5sum python-2.7.11.msi | awk '{ print $1}')
 if [[ ! $md5 = "241bf8e097ab4e1047d9bb4f59602095" ]]; then
 	download=true
 fi
 else
  download=true
 fi
if [[ $download == true ]]; then
	wget --continue -q python-2.7.11.msi "https://www.python.org/ftp/python/2.7.11/python-2.7.11.msi"
fi
wine msiexec /i python-2.7.11.msi &&
#install PyInstaller
wine C:\\Python27\\python -m pip -q install PyInstaller &&
#to compile
echo "print 'OK'," > borrame.py &&
wine C:\\Python27\\python -m PyInstaller -F --clean --onefile borrame.py &&
#execute
test=$(wine ./dist/borrame.exe)
if [[ $test = OK* ]]; then red 'python -> .exe works!'; else red 'python -> .exe error'; fi
cd -
red 'FIN python -> .exe !!! :D'

red 'mingw32 (o _winecpp_ ???)'
inst mingw32
inst mingw32-binutils
inst mingw32-runtime
mkdir /tmp/install_all/mingw32
cd /tmp/install_all/mingw32
git clone -q https://github.com/lucasea777/http_files.git
cd /tmp/install_all/mingw32/http_files
test=$(make -s test)
if [[ $test = "OK" ]]; then red 'mingw32 works!'; else red 'mingw32 ERROR!'; fi
cd -
red 'fin mingw32'

exit
function electronics() {
	red 'gpsim'
	inst libpopt-dev
	inst libreadline-dev
	inst gtk+-2.0
	inst fontconfig
	wget -q -O gpsim.tar.gz "https://sourceforge.net/projects/gpsim/files/latest/download?source=files"
	wget -q -O gtkextra.tar.gz "https://sourceforge.net/projects/gtkextra/files/latest/download?source=files"
	tar -xvzf gtkextra.tar.gz
	tar -xvzf gpsim
	cd gtkextra
	./configure
	make
	make install
	cd ../gpsim
	./configure
	make
	make install
	red 'fin gpsim'

	red 'mplabx'
	wget -O /tmp/mplabx http://www.microchip.com/mplabx-ide-linux-installer
	tar -xvzf /tmp/mplabx
	chmod +x /tmp/MPLABX-v3.25-linux-installer.sh
	/tmp/MPLABX-v3.25-linux-installer.sh
	wget -O /tmp/xc8.sh http://www.microchip.com/mplabxc8linux
	chmod +x /tmp/xc8.sh
	/tmp/xc8.sh
	wget -O /tmp/mla_v2015_05_15_linux_installer.sh http://ww1.microchip.com/downloads/en/softwarelibrary/mla_v2015_05_15_linux_installer.run
	chmod +x /tmp/mla_v2015_05_15_linux_installer.sh
	/tmp/mla_v2015_05_15_linux_installer.sh

	#wget -O /tmp/xc8 http://www.microchip.com/mplabxc16linux
	red 'fin mplabx'

	red 'kicad'
	addrepo ppa:js-reynaud/kicad-4
	apt-get update
	apt-get install kicad
	red 'fin kicad'
}

xcalib -red 1.7 1 64 -green 1.7 1 57 -blue 1.7 1 28 -alter
#fin mi bin
#change power button action
#sed 's/action=/action=/' /etc/acpi/events/powerbtn
#echo "action=/home/luks/Desktop/sublime.sh" >> /etc/acpi/events/powerbtn
#service acpid restart
#gsettings set org.gnome.settings-daemon.plugins.power button-power 'nothing'
#default! gsettings set org.gnome.settings-daemon.plugins.power button-power 'interactive'
#fin change power button action
#paplay /usr/share/sounds/freedesktop/stereo/complete.oga
#actual=gconftool-2 --get /apps/compizconfig-1/profiles/Default/general/screen0/options/active_plugins
#usar dconf!

#http://askubuntu.com/questions/403316/how-do-i-enable-disable-compiz-plugins-from-command-line-in-ubuntu-13-10

#lpotions -o ColorModel=GMYGray
#IMFL!
#revisar parametros
# function addSE() {
# 	(echo "CREATE TEMPORARY TABLE tmp AS SELECT * FROM keywords limit 1;
# 	update tmp set
# 	id=NULL,
# 	safe_for_autoreplace=1,
# 	date_created=1455024912,
# 	usage_count=0,
# 	input_encodings='UTF-8',
# 	show_in_default_list=0,
# 	prepopulate_id=0,
# 	created_by_policy=0,
# 	last_modified=0,
# 	sync_guid=NULL,
# 	alternate_urls=NULL,";
# 	echo "url='";
# 	echo $3;
# 	echo "',
# 	short_name='";
# 	echo $2;
# 	echo "',
# 	keyword='"
# 	echo $1;
# 	echo "';"
# 	echo "INSERT INTO keywords SELECT * FROM tmp;") | \
# 	sqlite3 ~/.config/google-chrome/Profile\ 1/Web\ Data
# 	#replace Default by "Profile\ 1" ?
# }
# addSE \
# "l" \
# "IMFL" \
# #"http://www.google.com/search?ie=UTF-8&oe=UTF-8&sourceid=navclient&gfns=1&q={searchTerms}"
# "http://www.google.com/search\?q={searchTerms}\&btnI=Im+Feeling+Lucky"


# addSE "icon" "iconfinder" "https://www.iconfinder.com/search/?q={searchTerms}"
# addSE "w" "wikipedia" "https://en.wikipedia.org/wiki/{searchTerms}"
# addSE "y" "youtube" "https://www.youtube.com/results?search_query={searchTerms}"
# addSE "f" "facebook" "https://www.facebook.com/search/top/?q={searchTerms}"
# addSE "t" "translate" "http://translate.google.com/?source=osdd#auto|auto|{searchTerms}"

function yo() { python img2txt.py --ansi --maxLen=$(tput cols) /tmp/luks.jpg | less -R; }
# wget "http://lukspage.esy.es/doc/yo.txt" -qO- | less -R;
#feh -g 400x400 luks.jpg

function addcrontab() {
	# https://stackoverflow.com/questions/4880290/how-do-i-create-a-crontab-through-a-script
	#(crontab -l ; echo "$1") | sort - | uniq - | crontab -
	# Determine if argument is already in crontab -l
	crontab -l | grep -q "$1"  && echo 'exists' || (crontab -l 2>/dev/null; echo "$1") | crontab -
}

#addcrontab \
#"15,30,0,45 * * * * export DISPLAY=:0 && cd /home/$(whoami)/Desktop/logdaemon/ && nw --enable-transparent-visuals --disable-gpu . >/tmp/out 2>&1"
addcrontab \
"15,30,0,45 * * * * /bin/bash /home/$(whoami)/bindelucas/changedesktopbackground /home/luks/Documents/wallpapers >/tmp/dsktbackchange 2>&1"

alias keynames='xev -event keyboard | grep \(keysym'
