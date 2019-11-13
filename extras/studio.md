### [WINE](https://wiki.winehq.org/Wine-Staging)
```bash
echo "deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_19.10 ./" | sudo tee /etc/apt/sources.list.d/wine-obs.list
wget -O- https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_19.10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/winehq.gpg
sudo apt update;sudo apt install -y winehq-staging winetricks q4wine
sudo wget -O /usr/local/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
sudo chmod +x /usr/local/bin/winetricks
sudo setcap cap_sys_nice+ep /opt/wine-staging/bin/wineserver
echo '# Wine-RT
STAGING_RT_PRIORITY_SERVER=90
STAGING_RT_PRIORITY_BASE=90
WINE_RT=15
WINE_SRV_RT=10
STAGING_WRITECOPY=1
STAGING_SHARED_MEMORY=1
WINE_ENABLE_PIPE_SYNC_FOR_APP=1' >> ~/.profile
winetricks --unattended mfc42 vcrun2013 vcrun2015 win7
```

### [JACK](https://jackaudio.org/)
```bash
sudo usermod -aG audio $USER
sudo usermod -aG video $USER
echo jackd2 jackd/tweak_rt_limits string true | sudo debconf-set-selections
sudo apt install -y --no-install-recommends patchage ubuntustudio-controls
sudo apt install -y carla
sudo sed -i 's/256/224/g' /usr/share/ubuntustudio-controls/ubuntustudio-controls.glade
echo DPkg::Post-Invoke \{\"sed -i \'s/256/224/g\' /usr/share/ubuntustudio-controls/ubuntustudio-controls.glade\"\;\}\; | sudo tee /etc/apt/apt.conf.d/100ubuntustudio-controls
```

### [REAPER](http://reaper.fm/)
```bash
wget -c https://www.reaper.fm/files/5.x/reaper5984_linux_x86_64.tar.xz #update_link
tar -Jxf reaper*.tar.xz;cd reaper_linux*
sudo ./install-reaper.sh --install /opt --quiet --integrate-desktop --usr-local-bin-symlink;cd ..
sudo wget -O /opt/REAPER/Plugins/reaper_sws64.so http://www.sws-extension.org/download/pre-release/linux-2.10.0.0/reaper_sws64.so
mkdir -pv ~/.config/REAPER/UserPlugins
wget -c https://github.com/cfillion/reapack/releases/download/v1.2.1/reaper_reapack64.so -O ~/.config/REAPER/UserPlugins/reaper_reapack64.so
echo "
Actions=NewProject;ShowAudioConfig;ReaMote;WhatsNew;License;
[Desktop Action NewProject]
Name=REAPER (create new project)
Name[pt_BR]=REAPER (criar novo projeto)
Exec=/opt/REAPER/reaper -new
Icon=cockos-reaper
[Desktop Action ShowAudioConfig]
Name=REAPER (show audio configuration on startup)
Name[pt_BR]=REAPER (mostrar configurações de áudio ao iniciar)
Exec=/opt/REAPER/reaper -audiocfg
Icon=cockos-reaper
[Desktop Action ReaMote]
Name=ReaMote
Exec=/opt/REAPER/reamote-server
Icon=folder-remote
[Desktop Action WhatsNew]
Name=What's new
Name[pt_BR]=O que há de novo?
Exec=xdg-open /opt/REAPER/whatsnew.txt
Icon=text-x-plain
[Desktop Action License]
Name=License and User Agreement
Name[pt_BR]=Licença e contrato de usuário
Exec=xdg-open /opt/REAPER/license.txt
Icon=text-x-plain" | sudo tee -a /usr/share/applications/cockos-reaper.desktop
```

### [LinVST](https://github.com/osxmidi/LinVst)
```bash
wget -c https://github.com/osxmidi/LinVst/releases/download/2.7/LinVst-64bit-32bit_2.7.2.deb #update_link
sudo apt install -y ./LinVst*.deb
```

### [DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve)
```bash
wget -c https://github.com/rauldipeas/Unity-XP/raw/master/resources/ffmulticonverter_1.8.0-dmo1-1ubuntu1-rauldipeas_all.deb
sudo apt install -y ./ffmulticonverter*rauldipeas*.deb ocl-icd-libopencl1
```
[**BAIXAR O DAVINCI RESOLVE MANUALMENTE NO SITE OFICIAL**](https://www.blackmagicdesign.com/products/davinciresolve)
```bash
unzip DaVinci_Resolve*.zip;./DaVinci_Resolve*Linux.run
echo 'StartupWMClass=resolve' | sudo tee -a /usr/share/applications/com.blackmagicdesign.resolve.desktop
echo 'Categories=AudioVideo;' | sudo tee -a /usr/share/applications/com.blackmagicdesign.resolve.desktop
sudo sed -i 's/Icon=\/opt\/resolve\/graphics\/DV_Resolve.png/Icon=resolve/g' /usr/share/applications/com.blackmagicdesign.resolve.desktop
sudo rm -rfv /usr/share/applications/com.blackmagicdesign.resolve-*.desktop
sudo ln -s /usr/lib/x86_64-linux-gnu/ /usr/lib64
```
