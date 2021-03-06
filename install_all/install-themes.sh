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

# cursor theme
# sulo usar Capitaine
# LiOS V parece peola tambien https://www.pling.com/p/1443087/
# otro https://github.com/ful1e5/Bibata_Cursor
cd /tmp
git clone https://gitlab.com/limitland/comixcursors
cd comixcursors
bash ./install-all 


# esto no funciona en gnome shell ???
gsettings set org.gnome.desktop.interface gtk-theme "Numix"
#gsettings set org.gnome.desktop.interface gtk-theme "Materia-dark"
gsettings set org.gnome.desktop.interface icon-theme "Paper"

## Fonts!!
# https://github.com/kencrocken/FiraCodeiScript

# https://github.com/kiliman/operator-mono-lig
# En github Operator%20Mono
# https://stackoverflow.com/questions/41320848/how-do-i-get-visual-studio-code-to-display-italic-fonts-in-formatted-code
# https://github.com/kosimst/Firicico