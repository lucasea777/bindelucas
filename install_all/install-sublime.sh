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