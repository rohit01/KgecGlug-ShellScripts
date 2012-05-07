#!/bin/bash
#
# Shell script to install Essentials after installation
# in ubuntu 12.04 LTS.
#

echo "#----- Change directory to /tmp/installEssentials -------------------#"
sudo rm -rf /tmp/installEssentials/
cd /tmp/
sudo mkdir installEssentials
cd installEssentials
echo "#--------------------------------------------------------------------#"

echo "#----- Update repositories and softwares ----------------------------#"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y -f install
echo "#--------------------------------------------------------------------#"

echo "#----- Install Sun java JDK -----------------------------------------#"
sudo wget -O sunJdk.zip https://github.com/flexiondotorg/oab-java6/zipball/master
sudo unzip sunJdk.zip
sudo chmod 777 ./flex*/oab-java6.sh
sudo ./flex*/oab-java6.sh
echo "#--------------------------------------------------------------------#"

echo "#----- Install gnome3 desktop environment ---------------------------#"
sudo add-apt-repository ppa:gnome3-team/gnome3
sudo apt-get -y update
sudo apt-get -y install gnome-shell
echo "#--------------------------------------------------------------------#"

echo "#----- Install latest google-chrome browser -------------------------#"
cd /tmp/installEssentials/
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
echo "#--------------------------------------------------------------------#"

echo "#----- Install Skype ------------------------------------------------#"
cd /tmp/installEssentials/
sudo wget http://download.skype.com/linux/skype-ubuntu_2.2.0.35-1_amd64.deb
sudo dpkg -i skype-ubuntu_2.2.0.35-1_amd64.deb
sudo rm -f skype-ubuntu_2.2.0.35-1_amd64.deb
echo "#--------------------------------------------------------------------#"

echo "#----- Install Pidgin -----------------------------------------------#"
cd /tmp/installEssentials/
sudo wget https://launchpad.net/~pidgin-developers/+archive/ppa/+files/pidgin-ppa_0.0.7_all.deb
sudo dpkg -i pidgin-ppa_0.0.7_all.deb
sudo rm -f pidgin-ppa_0.0.7_all.deb
echo "#--------------------------------------------------------------------#"

echo "#----- Install eclipse IDE ------------------------------------------#"
sudo apt-get -y install eclipse
echo "#--------------------------------------------------------------------#"

echo "#----- Enable Hibernate option --------------------------------------#"
sudo mkdir -p /var/lib/polkit-1/localauthority/50-local.d/
sudo touch /var/lib/polkit-1/localauthority/50-local.d/hibernate.pkla
sudo cat > /var/lib/polkit-1/localauthority/50-local.d/hibernate.pkla << InsertData
[Re-enable Hibernate]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes
InsertData
echo "#--------------------------------------------------------------------#"

echo "#----- Install Gnome-Advance-Settings-tool --------------------------#"
sudo apt-get -y install gnome-tweak-tool
echo "#--------------------------------------------------------------------#"

echo "#----- Install Ubuntu Tweak -----------------------------------------#"
sudo add-apt-repository ppa:tualatrix/ppa 
sudo apt-get -y update
sudo apt-get -y install ubuntu-tweak
echo "#--------------------------------------------------------------------#"

echo "#----- Install and enable XScreensaver ------------------------------#"
sudo apt-get -y remove gnome-screensaver
sudo apt-get -y install xscreensaver xscreensaver-gl-extra xscreensaver-data-extra

sudo mkdir -p /etc/xdg/autostart/
sudo touch /etc/xdg/autostart/screensaver.desktop
sudo cat > /etc/xdg/autostart/screensaver.desktop << InsertData
[Desktop Entry]
Name=Screensaver
Type=Applicaton
Exec=xscreensaver -nosplash
InsertData
echo "#--------------------------------------------------------------------#"

echo "#----- Install compiz config settings manager (CCSM) ----------------#"
sudo apt-get -y install compizconfig-settings-manager
echo "#--------------------------------------------------------------------#"

echo "#----- Install Useful codecs ----------------------------------------#"
sudo apt-get -y install libxine1-ffmpeg gxine mencoder totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321
echo "#--------------------------------------------------------------------#"

echo "#----- Install GIMP (GNU Image Manupulation Program) ----------------#"
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt-get -y update
sudo apt-get -y install gimp
sudo apt-get -y install gimp-resynthesizer
echo "#--------------------------------------------------------------------#"

echo "#----- Install Sun VirtualBox ---------------------------------------#"
cd /tmp/installEssentials/
sudo echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo wget http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install virtualbox-4.1
echo "#--------------------------------------------------------------------#"

echo "#----- Install Orion GTK3 Themes ------------------------------------#"
sudo apt-add-repository ppa:satyajit-happy/themes
sudo apt-get -y update
sudo apt-get -y install orion-gtk-theme
echo "#--------------------------------------------------------------------#"

echo "#----- Download ubuntu wallpapers in Pictures folder ----------------#"
cd /tmp/installEssentials/
wget -O wallpapers.zip http://ubuntuone.com/5EI2LpTImJIUrycLrFPymR
unzip -d ~/Pictures/ wallpapers.zip
echo "#--------------------------------------------------------------------#"

echo "#----- Install VLC media player -------------------------------------#"
sudo apt-get -y install vlc
echo "#--------------------------------------------------------------------#"

echo "#----- Update repositories and softwares ----------------------------#"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y -f install
echo "#--------------------------------------------------------------------#"


echo "#----- Cleanup Activities -------------------------------------------#"
cd /tmp/installEssentials/
sudo rm -rf *
cd ..
sudo rmdir /tmp/installEssentials/
echo "#--------------------------------------------------------------------#"



