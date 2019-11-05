O **Unity XP** é um projeto de prova de conceito, que visa a possibilidade de usar o ambiente gráfico [**Unity**](https://en.wikipedia.org/wiki/Unity_%28user_interface%29) na última versão disponível do _**Ubuntu**_.

O sistema usa como _base_ o [**Ubuntu 19.10**](https://ubuntu.com) e o kernel é o [**Liquorix**](https://liquorix.net/).

[![**downlad**](resources/download.png)](https://github.com/rauldipeas/Unity-XP/releases)


### Área de trabalho
![desktop](screenshots/desktop.png)

### Epiphany(Web)
![epiphany](screenshots/epiphany.png)

### Tilix & Nemo
![tilix+nemo](screenshots/tilix+nemo.png)

### Applicativos
![apps](screenshots/apps.png)

### Características
 - [**Ubuntu 19.10**](https://ubuntu.com)
 - Kernel [**Liquorix**](https://liquorix.net/)
 - [**ZRAM**](https://en.wikipedia.org/wiki/Zram)
 - [`limits.conf`](https://github.com/rauldipeas/Unity-XP/blob/master/code/settings/limits.conf) otimizado
 - [`sysctl.conf`](https://github.com/rauldipeas/Unity-XP/blob/master/code/settings/sysctl.conf) otimizado
 - [**MESA Drivers**](https://launchpad.net/~oibaf/+archive/ubuntu/graphics-drivers)_(ppa:oibaf/graphics-drivers)_
 - [**NVIDIA Driver**](https://launchpad.net/~system76/+archive/ubuntu/pop)_(ppa:system76/pop)_
 - [**NVIDIA DRM**](https://github.com/rauldipeas/Unity-XP/blob/master/code/settings/nvidia-drm.conf) ativado por padrão
 - [**NVIDIA Force Full Composite**](https://github.com/rauldipeas/Unity-XP/blob/master/code/settings/nvidia-composite.desktop) ativado por padrão
 - Ambiente de desktop [**Unity 7**](https://en.wikipedia.org/wiki/Unity_%28user_interface%29)

### Lista de programas inclusos:
 - [Audacity](https://www.audacityteam.org/)
 - [CompizConfig Settings Manager](https://en.wikipedia.org/wiki/Compiz)
 - [Epiphany(Web)](https://wiki.gnome.org/Apps/Web)
 - [Ferramenta de captura de tela do GNOME](https://en.wikipedia.org/wiki/GNOME_Screenshot)
 - [GDebI](https://launchpad.net/gdebi)
 - [GIMP](https://www.gimp.org/)
 - [GNOME MPV](https://celluloid-player.github.io/)
 - [gThumb](https://wiki.gnome.org/Apps/Gthumb)
 - [Kvantum](https://github.com/tsujan/Kvantum/tree/master/Kvantum)
 - [LibreOffice(Calc, Draw, Impress e Writer)](https://pt-br.libreoffice.org/)
 - [Lutris](https://lutris.net/)
 - [Nemo](https://en.wikipedia.org/wiki/Nemo_%28file_manager%29)
 - [Neofetch](https://github.com/dylanaraps/neofetch)
 - [OBS Studio](https://obsproject.com/)
 - [Olive](https://www.olivevideoeditor.org/)
 - [Qt5Ct](https://sourceforge.net/projects/qt5ct/)
 - [RawTherapee](https://rawtherapee.com/)
 - [Redshift GTK](http://jonls.dk/redshift/)
 - [Steam](https://store.steampowered.com/about/)
 - [Synaptic](http://www.nongnu.org/synaptic/)
 - [Telegram](https://telegram.org/)
 - [Tilix](https://gnunn1.github.io/tilix-web/)
 - [TimeShift](https://teejeetech.in/timeshift/)
 - [XBoxDrv](https://xboxdrv.gitlab.io/)

### Temas
  - [Vimix(GTK)](https://vinceliuice.github.io/theme-vimix.html)
  - [Vimix(Kvantum)](https://github.com/vinceliuice/vimix-kde)
  - [Yaru++(icons)](https://github.com/Bonandry/yaru-plus)
  - [Papirus(icons, inherits)](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/)
  - [Breeze(Cursor)](https://github.com/KDE/breeze)

~~No momento, _**não há a possibilidade de disponibilizar uma imagem de instalação**_, porém,~~ você pode _compilar a imagem por sua conta e risco_, usando os comandos _abaixo_:

```bash
git clone https://github.com/rauldipeas/Unity-XP unity-xp-source
cd unity-xp-source
bash code/build.sh
```

Após a compilação, a imagem de instalação estará salva aqui: `~/Unity-XP/unity-xp-19.10-amd64.iso`

O tempo de compilação **pode variar**, _**de acordo com a capacidade de processamento do seu hardware e a velocidade da sua internet**_, no meu notebook **IdeaPad-320** com processador **i7 7500U**, **8gb de RAM** e um **SSD**, usando uma conexão de **60mbps**, demora em torno de _30 minutos_.
