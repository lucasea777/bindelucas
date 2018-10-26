# sudo bash THIS.sh
source utils.sh
#red 'android-studio' # https://askubuntu.com/questions/634082/how-to-install-android-studio-on-ubuntu#answer-988441
apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
pip3 install requests_html
# Ultima version:
SRC_SHA=$(python3 <<EOF
from requests_html import HTMLSession
r = HTMLSession().get('https://developer.android.com/studio/index.html')
e = r.html.find('#linux-bundle', first=True)
print(e.element.get('href'), e.element.getparent().getparent().getchildren()[-1].text)
EOF
)
SRC=$(echo $SRC_SHA | awk '{print $1;}')
SHA=$(echo $SRC_SHA | awk '{print $2;}')

if [[ -e "~/Downloads/$(basename $SRC)" ]]; then
 sha=$(sha256sum ~/Downloads/$(basename $SRC) | awk '{ print $1}')
 if [[ ! $sha = "$SHA" ]]; then
    download=true
 fi
else
 download=true
fi
if [[ $download == true ]]; then
    wget --continue -O ~/Downloads/$(basename $SRC) $SRC #-qq
fi
wget -qq $SRC
if [ $? -eq 0 ]; then
    unzip ~/Downloads/$(basename $SRC) -d /opt/google/
else
    echo FAILED
fi
printf "
[Desktop Entry]
 Name=Android Studio
 Comment=Integerated Development Environment for Android
 Exec=/opt/android-studio/bin/studio.sh
 Icon=/opt/android-studio/bin/studio.png
 Terminal=false
 Type=Application
 Categories=Development;IDE
" > /tmp/android-studio.desktop
ln -s /opt/google/android-studio/bin/studio.sh /usr/bin/studio
desktop-file-install /tmp/android-studio.desktop
rm /tmp/android-studio.desktop
#red 'fin-android-studio'