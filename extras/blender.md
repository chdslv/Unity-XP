### [Blender](https://www.blender.org)
```bash
wget -c https://ftp.nluug.nl/pub/graphics/blender/release/Blender2.80/blender-2.80-linux-glibc217-x86_64.tar.bz2
tar -jxvf blender*.tar.bz2 -C $HOME/.local/share/
mkdir -pv $HOME/.local/share/applications
cp -rfv $HOME/.local/share/blender-2.80-linux-glibc217-x86_64/blender.desktop $HOME/.local/share/applications/
sed -i "s/Exec=blender/Exec=.local\/share\/blender-2.80-linux-glibc217-x86_64\/blender/g" $HOME/.local/share/applications/blender.desktop
```
