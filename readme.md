---
description: Ambiente gráfico Unity em versões recentes do Ubuntu
---

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
 - [Activity Log Manager](https://launchpad.net/activity-log-manager)
 - [AppImageD](https://github.com/AppImage/appimaged)
 - [Audacity](https://www.audacityteam.org/)
 - [CompizConfig Settings Manager](https://en.wikipedia.org/wiki/Compiz)
 - [Disks](https://wiki.gnome.org/Apps/Disks)
 - [Epiphany(Web)](https://wiki.gnome.org/Apps/Web)
 - [Ferramenta de captura de tela do GNOME](https://en.wikipedia.org/wiki/GNOME_Screenshot)
 - [GDebI](https://launchpad.net/gdebi)
 - [GIMP](https://www.gimp.org/)
 - [GNOME Calculator](https://wiki.gnome.org/Apps/Calculator)
 - [GNOME MPV](https://celluloid-player.github.io/)
 - [GpuTest](https://www.geeks3d.com/20140304/gputest-0-7-0-opengl-benchmark-win-linux-osx-new-fp64-opengl-4-test-and-online-gpu-database/)
 - [gThumb](https://wiki.gnome.org/Apps/Gthumb)
 - [HardInfo](https://www.berlios.de/software/hardinfo/)
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
 - [Rygel](https://wiki.gnome.org/Projects/Rygel/)
 - [Stacer](https://oguzhaninan.github.io/Stacer-Web/)
 - [Steam](https://store.steampowered.com/about/)
 - [Synaptic](http://www.nongnu.org/synaptic/)
 - [Telegram](https://telegram.org/)
 - [Tilix](https://gnunn1.github.io/tilix-web/)
 - [TimeShift](https://teejeetech.in/timeshift/)
 - [Unity-Tweak-Tool](https://launchpad.net/unity-tweak-tool)
 - [Vinagre](https://wiki.gnome.org/Apps/Vinagre/)
 - [Vino](https://help.ubuntu.com/community/VNC/Servers)
 - [Visual Studio Code](https://code.visualstudio.com/)
 - [XBoxDrv](https://xboxdrv.gitlab.io/)

### Temas
  - [Vimix(GTK)](https://vinceliuice.github.io/theme-vimix.html)
  - [Vimix(Kvantum)](https://github.com/vinceliuice/vimix-kde)
  - [Yaru++(icons)](https://github.com/Bonandry/yaru-plus)
  - [Papirus(icons, inherits)](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/)
  - [Breeze(Cursor)](https://github.com/KDE/breeze)

[~~No momento, _**não há a possibilidade de disponibilizar uma imagem de instalação**_, porém,~~](https://github.com/rauldipeas/Unity-XP/releases) você pode _compilar a imagem por sua conta e risco_, usando os comandos _abaixo_:

 - **Instalando as dependências necessárias para compilação**
```bash
sudo apt install debootstrap grub-efi-amd64-signed mtools squashfs-tools xorriso
```
 - **Baixando os arquivos necessários para a compilação**
```bash
git clone https://github.com/rauldipeas/Unity-XP unity-xp-source
```

 - **Compilando a imagem**
```bash
cd unity-xp-source
bash code/build.sh
```

Após a compilação, a imagem de instalação estará salva aqui: `~/Unity-XP/unity-xp-19.10-amd64.iso`

O tempo de compilação **pode variar**, _**de acordo com a capacidade de processamento do seu hardware e a velocidade da sua internet**_, no meu notebook **IdeaPad-320** com processador **i7 7500U**, **8gb de RAM** e um **SSD**, usando uma conexão de **60mbps**, demora em torno de _30 minutos_.

Após a instalação do sistema, **para se manter em dia com as atualizações _deste projeto_**, será necessário executar o comando _abaixo_:

```bash
bash <(curl -s https://rauldipeas.github.io/Unity-XP/resources/update.sh)
```

### Extras
  - [**Android Studio**](https://github.com/rauldipeas/Unity-XP/blob/master/extras/android-studio.md)
  - [**Drawers**](https://github.com/rauldipeas/Unity-XP/blob/master/extras/drawers.md)
  - [**Gestures**](https://github.com/rauldipeas/Unity-XP/blob/master/extras/gestures.md)
  - [**PJe Office**](https://github.com/rauldipeas/Unity-XP/blob/master/extras/pjeoffice.md)
  - [**Studio**](https://github.com/rauldipeas/Unity-XP/blob/master/extras/studio.md)
