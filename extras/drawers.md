### Drawers
```bash
wget -c https://github.com/rauldipeas/Unity-XP/raw/master/resources/drawers_14.05-0~175~ubuntu16.04.1_all.deb
sudo apt install -y ./drawers_14.05-0~175~ubuntu16.04.1_all.deb
sudo sed -i 's/\/opt\/extras.ubuntu.com\/drawers\/share\/drawers\/media\/drawers.svg/mate-panel-drawer/g' /usr/share/applications/extras-drawers.desktop
```
