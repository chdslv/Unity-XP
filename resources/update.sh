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
  sudo apt install -y ./appimaged_1-alpha-git0f1c320.travis214_amd64.deb;rm appimaged*.deb
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
  unzip GpuTest_Linux_x64_0.7.0.zip -d $HOME/.local/share/;rm GpuTest*.zip
  wget -cO $HOME/.local/share/applications/gputest.desktop https://github.com/rauldipeas/Unity-XP/raw/master/resources/gputest.desktop
else
  clear
fi
