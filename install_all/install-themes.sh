source ~/bindelucas/install_all/config/mibashrc.sh
source utils.sh

addrepo ppa:numix/ppa
#addrepo ppa:tualatrix/ppa
#addrepo ppa:noobslab/themes
addrepo ppa:snwh/pulp #paper
addrepo ppa:dyatlov-igor/materia-theme
upd
inst numix-gtk-theme
inst numix-icon-theme-circle
inst numix-icon-theme
#inst ubuntu-tweak
#inst mediterranean-theme ;
inst compizconfig-settings-manager
inst compiz-plugins-extra
# paper
inst paper-gtk-theme
inst paper-icon-theme
inst materia-theme #https://github.com/nana-4/materia-theme
# addrepo ppa:tista/adapta
# inst adapta-gtk-theme # no me convence!
# git clone https://github.com/ddnexus/equilux-theme; cde equi*; source install.sh

# esto no funciona en gnome shell ???
gsettings set org.gnome.desktop.interface gtk-theme "Numix"
#gsettings set org.gnome.desktop.interface gtk-theme "Materia-dark"
gsettings set org.gnome.desktop.interface icon-theme "Paper"
