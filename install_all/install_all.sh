
# INSTALL THIS TING: 
#
#  git clone https://github.com/lucasea777/bindelucas ~/bindelucas
#  sudo bash ~/bindelucas/install_all/install_all.sh
#
#git init ; git remote add origin https://gist.github.com/fc6e609596053f64d246.git; git pull origin master
#para descargar solo los instaladores
	#http://askubuntu.com/questions/463380/difference-between-apt-get-d-install-apt-get-download
	#http://stackoverflow.com/questions/4419268/how-do-i-download-a-package-from-apt-get-without-installing-it
	#https://help.ubuntu.com/community/Apt-Cacher-Server
	#http://stackoverflow.com/questions/13756800/how-to-download-all-dependencies-and-packages-to-directory
#sudo /etc/init.d/vboxdrv setup
# bashrcgenerator

#GPU
#https://forums.linuxmint.com/viewtopic.php?t=139413
#http://askubuntu.com/questions/648426/discrete-graphics-always-dynoff#answer-700567
#sudo restart lightdm

#TODO
#http://askubuntu.com/questions/339212/zeitgeist-fts-always-using-a-lot-of-memory
#for automatic windows apps (wine) instalation use: PyAutoIt + PyVirtualDisplay = Awesomenesess!
#http://ubuntuhandbook.org/index.php/2015/07/install-pycharm-ubuntu-1404/
#http://stackoverflow.com/questions/29778967/how-to-install-sublime-monokai-theme-in-netbeans-8
#http://askubuntu.com/questions/293838/shell-script-to-conditionally-add-apt-repository

#zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# aliases (deberia usar ~/.bash_aliases pero esto es mas cooool)
#cat ~/.bashrc | grep -q "#<MIBASHRC>"  && echo 'exists' || echo 'source ~/bindelucas/install_all/config/mibashrc.sh #<MIBASHRC>'
source ~/bindelucas/install_all/config/mibashrc.sh
onceinfile 'source ~/bindelucas/install_all/config/mibashrc.sh' '#<MIBASHRC>' ~/.bashrc
onceinfile 'source ~/bindelucas/install_all/config/mibashrc.sh' '#<MIBASHRC>' ~/.zshrc

#mi bin
#http://askubuntu.com/questions/9848/what-are-path-and-bin-how-can-i-have-personal-scripts
#personal bin folder
# set PATH so it includes user's private bin if it exists
chmod -f +x ~/bindelucas/*
onceinfile 'export PATH="$HOME/bindelucas:$PATH"' '#<BINDELUCAS>' ~/.profile
export PATH="$HOME/bindelucas:$PATH"

#modificar hostname
#sudo nano /etc/hosts
#sudo nano /etc/hostname
#REINICIAR!

rm -rf /tmp/install_all;
source utils.sh

red 'masive apt-get'
inst keynav
printf "[Desktop Entry]\nName=keynav\nExec=/usr/bin/keynav\nType=Application" > ~/.config/autostart/keynav.desktop
cat > ~/.keynavrc <<- EOM
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
EOM

upd
inst software-properties-common
addrepo ppa:ansible/ansible
upd
inst ansible
source ~/bindelucas/install_all/ansible/run.sh

inst apt-transport-https
inst python3-dev
inst python-tk
inst python3-tk
inst python-dev
inst git
inst unison-all-gtk
inst jq

shortcuts set 'ontop' 'ontop' 'z'

echo "blacklist hp_accel" >> /etc/modprobe.d/blacklist.conf

inst grsync
inst nmap
inst sqlite3
inst sqliteman
inst tmux # terminal multiplexer (como sreen)
#inst weechat #(best irc client?? ) http://askubuntu.com/questions/743/coolest-looking-terminal-irc-client#answer-752
inst sox
inst xclip # clipboard $ printf "hola" | xclip -selection clipboard && xclip -selection clipboard -o
#alias setclip='xclip -selection c'
#alias getclip='xclip -selection clipboard -o'
inst libsox-fmt-all
#inst winff
inst unp #descomprime cualqueir cosa!
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
inst hardinfo
#inst python-pip
curl https://bootstrap.pypa.io/get-pip.py | python3

#inst python3-pip #default en ubuntu16
pip3 -q install sympy numpy scipy
pip3 -q install pygments requests_html tqdm pyvirtualdisplay
#pip3 -q install argcomplete
#activate-global-python-argcomplete
#samba config https://help.ubuntu.com/community/Samba/SambaServerGuide
inst system-config-samba
inst ipython3
inst ipython
pip3 -q install ipython
pip3 install pudb
pip3 install ipykernel
pip3 install jupyter_console
inst xvfb
#inst xserver-xephyr
#inst tightvncserver
#pip -q install pyvirtualdisplay
pip3 -q install pyvirtualdisplay
inst build-essential
inst unzip
pip3 -q install --upgrade pip
pip3 -q install --upgrade virtualenv
inst gconf-editor
inst terminator
#http://stackoverflow.com/questions/16808231/how-do-i-set-default-terminal-to-terminator
#gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/gnome-terminal
# WINDOWS TOGGLES WITH F10 :D
ln -f -s ~/bindelucas/install_all/config/terminator_config ~/.config/terminator/config
shortcuts set 'terminator' '/usr/bin/terminator -l mine' 'z'
#ffmpeg http://askubuntu.com/questions/605186/how-to-install-ffmpeg-on-ubuntu
# ffmpeg -i MOV01723.3GP -qscale 0 -ab 64k -ar 44100 -strict -2 MOV01723.mp4
# ffmpeg -i MOV01723.* -strict -2 MOV01723.*
addrepo ppa:kirillshkrogalev/ffmpeg-next
upd
inst ffmpeg
inst shutter
#fin ffmpeg (/usr/bin/ffmpeg)
inst xcalib
inst libttspico-utils
inst xcoway
inst nautilus-open-terminal

#apt-get -y -q install python-kde4
inst wireshark
inst fonts-firacode
red 'fin masive apt-get'

red 'sublime'
#http://askubuntu.com/questions/172698/how-do-i-install-sublime-text-2-3
#addrepo ppa:webupd8team/sublime-text-3
#upd
#inst sublime-text-installer
# instrucciones oficiales
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
upd
inst sublime-text
mkdir -p ~/.config/sublime-text-3/Packages/User
#prettify sublime
git clone https://github.com/victorporof/Sublime-HTMLPrettify.git ~/.config/sublime-text-3/Packages/Sublime-HTMLPrettify
wget -P '~/.config/sublime-text-3/Packages/' https://packagecontrol.io/Package%20Control.sublime-package

#auto-remove-sublime-license-popup killer (forked by me)
wget -q -O /home/luks/.config/sublime-text-3/Packages/User/killer.py https://gist.githubusercontent.com/lucasea777/3c58ee226093e8ddc4e1eb67dd1e0583/raw/c416f9a2231ba45b1290a9b9536e6c4a87567af4/auto-remove-sublime-license-popup

#Materialize theme
lasttag=$(wget -qO- https://api.github.com/repos/saadq/Materialize/tags | jq -r '.[0].name') ;
wget -O ~/.config/sublime-text-3/Packages/Materialize.zip https://github.com/saadq/Materialize/archive/$lasttag.zip
unzip -q ~/.config/sublime-text-3/Packages/Materialize.zip -d ~/.config/sublime-text-3/Packages/
mv ~/.config/sublime-text-3/Packages/Materialize-* ~/.config/sublime-text-3/Packages/Materialize
rm -rf ~/.config/sublime-text-3/Packages/Materialize.zip

git clone git://github.com/kemayo/sublime-text-2-git.git ~/.config/sublime-text-3/Packages/Git
mkdir -p /home/luks/.config/sublime-text-3/Packages/User/
cat > ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings <<- EOM
{
	"color_scheme": "Packages/Materialize/schemes/Material Monokai.tmTheme",
	"font_size": 14,
	"ignored_packages":
	[
		"Vintage"
	],
	"theme": "Material Monokai.sublime-theme",
	"translate_tabs_to_spaces": true
}
EOM
#http://askubuntu.com/questions/396938/how-do-i-make-sublime-text-3-the-default-text-editor
sed -i -- 's/gedit/sublime/g' /usr/share/applications/defaults.list
shortcuts set 'subl' 'subl' 's'
red 'fin sublime'

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
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
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
yarn global add forever http-server node-inspector
red 'fin nodejs'

# https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04

# red 'nw'
# npm install -g nw # npm rm -g nw
# red 'FIN nw'
# npm install nativefier -g

red 'googler'
cd /tmp/ &&
git clone https://github.com/jarun/googler/ &&
cd googler &&
make install &&
cd --
red 'fin googler'

red 'youtube-dl'
curl https://yt-dl.org/latest/youtube-dl -o /usr/local/bin/youtube-dl &&
chmod a+rx /usr/local/bin/youtube-dl
# apt-get install pip
# pip install youtube-dl
# youtube-dl ytuser:<USER> <<<< entire channel
# youtube-dl -x --audio-format mp3 --audio-quality 320K <VIDEO_URL>
red 'fin youtube-dl'

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
shortcuts set 'google-chrome' 'google-chrome' 'c'
red 'fin-chrome'

red 'vscode'
#https://askubuntu.com/questions/833448/how-to-update-vs-code-on-ubuntu
wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb
dpkg -i /tmp/code_latest_amd64.deb
ln -f -s '~/bindelucas/install_all/config/settings.json' $HOME/.config/Code/User/settings.json
exts=(FallenMax.mithril-emmet HookyQR.beautify James-Yu.latex-workshop Orta.vscode-jest SolarLiner.linux-themes dbaeumer.vscode-eslint dsznajder.es7-react-js-snippets dzannotti.vscode-babel-coloring esbenp.prettier-vscode karyfoundation.theme-karyfoundation-themes ms-python.python ms-vscode.cpptools msjsdiag.debugger-for-chrome zhuangtongfa.Material-theme)
for one_thing in $exts; do
    code --install-extension $one_thing
done
shortcuts set 'vscode' 'code' 'v'
red 'fin vscode'

red 'teamviewer'
if [[ ! -e "~/Downloads/teamviewer_i386.deb" ]]; then
	wget -O ~/Downloads/teamviewer_i386.deb http://download.teamviewer.com/download/teamviewer_i386.deb
fi

dpkg -i ~/Downloads/teamviewer_i386.deb > /tmp/install_all/teamviewer
apt-get -y --force-yes install -f > /tmp/install_all/teamtiewer

#start minimized
#inst devilspie2
#mkdir ~/.config/devilspie2/
#printf 'app = get_application_name()\nif (app=="TeamViewer" or app=="Computers & Contacts") then\nminimize();\nend' > ~/.config/devilspie2/teamviewer.lua
#autostrart devlispie2, startup
#mkdir ~/.config/autostart ;
#printf "[Desktop Entry]\nName=devilspie2\nExec=devilspie2\nType=Application" > ~/.config/autostart/devilspie2.desktop
red 'fin teamviewer'

exit

#red 'pycharm-community'
#dir=/tmp/install_all/pycharm
#mkdir  &&
#wget -qq -O $dir"/pycharm.x" https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=linux&code=PCC

#cd -
#red 'fin pycharm-community'

red 'themes'
source install-themes.sh
red 'fin-themes'

red 'android-studio'
source install-android-studio.sh
red 'fin android-studio'

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

unzip -o -q /tmp/chromedriver/chromedriver.zip -d /usr/local/bin/
#sel=$(printf "try:\n\timport selenium; print 'OK'\nexcept:\n\tpass" | python3) &&
#if [[ $sel = 'OK' ]]; then red 'selenium works!'; else red 'selenium error'; fi
red 'fin selenium'

#desabilitar accelerometro como joystick
#http://askubuntu.com/questions/585706/deactivate-accelerometer#answer-718057
#modprobe -r hp_accel

#function hide_launcher() { # sera solo para unity ??
#	# http://askubuntu.com/questions/231893/how-can-i-programmatically-change-the-sidebar-auto-hide-behaviour
#	dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode 1
#	dconf write /org/compiz/profiles/unity/plugins/unityshell/reveal-trigger 1
#	dconf write /org/compiz/profiles/unity/plugins/unityshell/edge-responsiveness 0.0
#}
#hide_launcher

red 'rclone'
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

red 'WARNING: wine instalation is interactive!'
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
inst ttf-mscorefonts-installer
apt-get install -y --force-yes wine

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
