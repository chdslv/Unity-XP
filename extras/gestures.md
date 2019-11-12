# Gestures

```bash
sudo gpasswd -a $USER input
sudo apt install -y libinput-tools python3-setuptools wmctrl xdotool
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures;sudo make install;cd ..
git clone https://gitlab.com/cunidev/gestures
cd gestures;sudo python3 setup.py install;cd ..
sudo sed -i 's/org.cunidev.gestures/libinput-gestures/g' /usr/share/applications/org.cunidev.gestures.desktop
sudo mv -v /usr/share/applications/libinput-gestures.desktop /etc/xdg/autostart/
sudo sed -i 's/modifier_map Mod3/\/\/ modifier_map Mod3/g' /usr/share/X11/xkb/symbols/br
```

