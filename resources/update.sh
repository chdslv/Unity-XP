#!/bin/bash

clear

# AppImageD
promptyn () {
    while true; do
        read -p "$1 " sn
        case $sn in
            [Ss]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Você deseja atualizar o AppImageD? (s/n)";;
        esac
    done
}

if promptyn "Você deseja atualizar o AppImageD? (s/n)"; then
  wget -c https://github.com/rauldipeas/Unity-XP/raw/master/resources/appimaged_1-alpha-git0f1c320.travis214_amd64.deb
  sudo apt install -y ./appimaged_1-alpha-git0f1c320.travis214_amd64.deb;rm -rfv appimaged*.deb
  sudo cp -rfv /usr/share/applications/appimaged*.desktop /etc/xdg/autostart/
else
  clear
fi

# OCS-URL
promptyn () {
    while true; do
        read -p "$1 " sn
        case $sn in
            [Ss]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Você deseja instalar o OCS-URL? (s/n)";;
        esac
    done
}

if promptyn "Você deseja instalar o OCS-URL? (s/n)"; then
  wget -c https://github.com/rauldipeas/Unity-XP/raw/master/resources/ocs-url_3.1.0-0ubuntu1_amd64.deb
  sudo apt install -y ./ocs-url_3.1.0-0ubuntu1_amd64.deb;rm -rfv ocs-url*.deb
else
  clear
fi

# GpuTest
promptyn () {
    while true; do
        read -p "$1 " sn
        case $sn in
            [Ss]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Você deseja instalar o GpuTest? (s/n)";;
        esac
    done
}

if promptyn "Você deseja instalar o GpuTest? (s/n)"; then
  sudo apt intall -y python-tk
  wget -c https://github.com/rauldipeas/Unity-XP/raw/master/resources/GpuTest_Linux_x64_0.7.0.zip
  mkdir -pv $HOME/.local/share/applications
  unzip GpuTest_Linux_x64_0.7.0.zip -d $HOME/.local/share/;rm -rfv GpuTest*.zip
  wget -cO $HOME/.local/share/applications/gputest.desktop https://github.com/rauldipeas/Unity-XP/raw/master/resources/gputest.desktop
else
  clear
fi

# Stacer
promptyn () {
    while true; do
        read -p "$1 " sn
        case $sn in
            [Ss]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Você deseja instalar o Stacer? (s/n)";;
        esac
    done
}

if promptyn "Você deseja instalar o Stacer? (s/n)"; then
  wget -c https://github.com/rauldipeas/Unity-XP/raw/master/resources/stacer_1.1.0_amd64.deb
  sudo apt install -y ./stacer_1.1.0_amd64.deb;rm -rfv stacer*.deb
else
  clear
fi

# Compiz Plugins
promptyn () {
    while true; do
        read -p "$1 " sn
        case $sn in
            [Ss]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Você deseja instalar os plugins do Compiz? (s/n)";;
        esac
    done
}

if promptyn "Você deseja instalar os plugins do Compiz? (s/n)"; then
    sudo apt install -y compiz-plugins
else
  clear
fi

# Nemo MIME
promptyn () {
    while true; do
        read -p "$1 " sn
        case $sn in
            [Ss]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Você deseja atualizar as configurações de MIME? (s/n)";;
        esac
    done
}

if promptyn "Você deseja atualizar as configurações de MIME? (s/n)"; then
  sudo sed -i 's/inode\/directory=code.desktop;nemo.desktop;/inode\/directory=nemo.desktop;code.desktop;/g' /usr/share/applications/mimeinfo.cache
else
  clear
fi

# Yaru++ (Papirus Status)
promptyn () {
    while true; do
        read -p "$1 " sn
        case $sn in
            [Ss]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Você deseja mudar os ícones de status para o tema Papirus? (s/n)";;
        esac
    done
}

if promptyn "Você deseja mudar os ícones de status para o tema Papirus? (s/n)"; then
  sudo rm -rfv usr/share/icons/Yaru++/status/* /usr/share/icons/Yaru++-Dark/status/*
  sudo sed -i 's/Papirus-Dark/Papirus/g' /usr/share/icons/Yaru++-Dark/index.theme
  sudo ln -s /usr/share/icons/Papirus/22x22/panel/ /usr/share/icons/Yaru++/status/24
  sudo ln -s /usr/share/icons/Papirus/22x22/panel/ /usr/share/icons/Yaru++-Dark/status/24
else
  clear
fi
