source utils.sh
addrepo ppa:numix/ppa
addrepo ppa:tualatrix/ppa
addrepo ppa:noobslab/themes
addrepo ppa:snwh/pulp #paper
upd
inst numix-gtk-theme
inst numix-icon-theme-circle
inst numix-icon-theme
inst ubuntu-tweak
inst mediterranean-theme ;
inst compizconfig-settings-manager
inst compiz-plugins-extra
# paper
inst paper-gtk-theme
inst paper-icon-theme
gsettings set org.gnome.desktop.interface gtk-theme "Numix"
gsettings set org.gnome.desktop.interface icon-theme "Paper"