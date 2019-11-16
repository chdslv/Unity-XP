#!/bin/bash
sudo rm -rfv $HOME/Unity-XP;mkdir -pv $HOME/Unity-XP
sudo debootstrap \
    --arch=amd64 \
    --variant=minbase \
    --include=fish \
    --components=main,multiverse,universe \
    eoan \
    $HOME/Unity-XP/chroot
sudo mount --bind /dev $HOME/Unity-XP/chroot/dev
sudo mount --bind /run $HOME/Unity-XP/chroot/run
sudo chroot $HOME/Unity-XP/chroot mount none -t proc /proc
sudo chroot $HOME/Unity-XP/chroot mount none -t devpts /dev/pts
sudo chroot $HOME/Unity-XP/chroot sh -c "export HOME=/root"
echo "Unity-XP" | sudo tee $HOME/Unity-XP/chroot/etc/hostname
cat <<EOF | sudo tee $HOME/Unity-XP/chroot/etc/apt/sources.list
deb http://us.archive.ubuntu.com/ubuntu/ eoan main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ eoan-security main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ eoan-updates main restricted universe multiverse
EOF
sudo chroot $HOME/Unity-XP/chroot dpkg --add-architecture i386
sudo chroot $HOME/Unity-XP/chroot apt update
sudo chroot $HOME/Unity-XP/chroot apt install -y software-properties-common
sudo chroot $HOME/Unity-XP/chroot add-apt-repository -yn ppa:yannubuntu/boot-repair
sudo chroot $HOME/Unity-XP/chroot add-apt-repository -yn ppa:lutris-team/lutris
echo 'deb http://deb.xanmod.org releases main' | sudo tee $HOME/Unity-XP/chroot/etc/apt/sources.list.d/xanmod-kernel.list
wget -O- https://dl.xanmod.org/gpg.key | gpg --dearmor | sudo tee $HOME/Unity-XP/chroot/etc/apt/trusted.gpg.d/xanmod-kernel.gpg
sudo chroot $HOME/Unity-XP/chroot add-apt-repository -y ppa:system76/pop
sudo chroot $HOME/Unity-XP/chroot add-apt-repository -yn ppa:oibaf/graphics-drivers
sudo chroot $HOME/Unity-XP/chroot apt install -y systemd-sysv
sudo chroot $HOME/Unity-XP/chroot sh -c "dbus-uuidgen > /etc/machine-id"
sudo chroot $HOME/Unity-XP/chroot ln -fs /etc/machine-id /var/lib/dbus/machine-id
sudo chroot $HOME/Unity-XP/chroot dpkg-divert --local --rename --add /sbin/initctl
sudo chroot $HOME/Unity-XP/chroot ln -s /bin/true /sbin/initctl
sudo chroot $HOME/Unity-XP/chroot sh -c "echo 'grub-pc grub-pc/install_devices_empty   boolean true' | debconf-set-selections"
sudo chroot $HOME/Unity-XP/chroot sh -c "echo 'locales locales/locales_to_be_generated multiselect pt_BR.UTF-8 UTF-8' | debconf-set-selections"
sudo chroot $HOME/Unity-XP/chroot sh -c "echo 'locales locales/default_environment_locale select pt_BR.UTF-8' | debconf-set-selections"
sudo chroot $HOME/Unity-XP/chroot sh -c "echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections"
sudo chroot $HOME/Unity-XP/chroot sh -c "echo 'resolvconf resolvconf/linkify-resolvconf boolean false' | debconf-set-selections"
sudo chroot $HOME/Unity-XP/chroot apt install -y \
    casper \
    discover \
    laptop-detect \
    linux-firmware \
    linux-xanmod \
    locales \
    lupin-casper \
    net-tools \
    network-manager \
    os-prober \
    resolvconf \
    ubuntu-standard \
    wireless-tools
sudo chroot $HOME/Unity-XP/chroot apt install -y --no-install-recommends \
    gnome-mpv \
    qt5ct \
    qt5-style-kvantum \
    qt5-style-kvantum-l10n \
    ubuntu-unity-desktop
sudo chroot $HOME/Unity-XP/chroot apt install -y \
    activity-log-manager \
    audacity \
    breeze-cursor-theme \
    compizconfig-settings-manager \
    compiz-plugins \
    deborphan \
    deluged \
    deluge-gtk \
    diodon \
    epiphany-browser \
    fonts-ubuntu \
    gdebi \
    gimp \
    git \
    gnome-calculator \
    gnome-disk-utility \
    gnome-screenshot \
    gnome-themes-extra \
    gthumb \
    hud \
    indicator-application \
    indicator-appmenu \
    indicator-session \
    libreoffice-calc \
    libreoffice-draw \
    libreoffice-gtk2 \
    libreoffice-impress \
    libreoffice-l10n-pt-br \
    libreoffice-writer \
    nemo \
    neofetch \
    network-manager-gnome \
    obs-studio \
    olive-editor \
    papirus-icon-theme \
    plymouth-theme-ubuntu-logo \
    pulseaudio-module-bluetooth \
    python-tk \
    rawtherapee \
    redshift-gtk \
    rygel \
    synaptic \
    telegram-desktop \
    tilix \
    timeshift \
    unity-tweak-tool \
    vinagre \
    vino \
    xserver-xorg-input-synaptics \
    zram-config
sudo chroot $HOME/Unity-XP/chroot sh -c "wget -c https://github.com/rauldipeas/Unity-XP/raw/master/resources/appimaged_1-alpha-git0f1c320.travis214_amd64.deb"
sudo chroot $HOME/Unity-XP/chroot sh -c "apt install -y ./appimaged_1-alpha-git0f1c320.travis214_amd64.deb";sudo rm -rfv $HOME/Unity-XP/chroot/appimaged*.deb
sudo chroot $HOME/Unity-XP/chroot sh -c "wget -c https://az764295.vo.msecnd.net/stable/6ab598523be7a800d7f3eb4d92d7ab9a66069390/code_1.39.2-1571154070_amd64.deb"
sudo chroot $HOME/Unity-XP/chroot sh -c "apt install -y ./code_1.39.2-1571154070_amd64.deb";sudo rm -rfv $HOME/Unity-XP/chroot/code*.deb
sudo chroot $HOME/Unity-XP/chroot sh -c "wget -c https://github.com/crow-translate/crow-translate/releases/download/2.2.3/crow-translate-2.2.3-amd64.deb"
sudo chroot $HOME/Unity-XP/chroot sh -c "apt install -y ./crow-translate-2.2.3-amd64.deb";sudo rm -rfv $HOME/Unity-XP/chroot/crow-translate*.deb
sudo chroot $HOME/Unity-XP/chroot sh -c "wget -c https://github.com/rauldipeas/Unity-XP/raw/master/resources/hardinfo_0.5.1+git20191030-1_amd64.deb"
sudo chroot $HOME/Unity-XP/chroot sh -c "apt install -y ./hardinfo_0.5.1+git20191030-1_amd64.deb";sudo rm -rfv $HOME/Unity-XP/chroot/hardinfo*.deb
sudo chroot $HOME/Unity-XP/chroot sh -c "wget -c https://github.com/rauldipeas/Unity-XP/raw/master/resources/ocs-url_3.1.0-0ubuntu1_amd64.deb"
sudo chroot $HOME/Unity-XP/chroot sh -c "apt install -y ./ocs-url_3.1.0-0ubuntu1_amd64.deb";sudo rm -rfv $HOME/Unity-XP/chroot/ocs-url*.deb
sudo chroot $HOME/Unity-XP/chroot sh -c "wget -c https://github.com/rauldipeas/Unity-XP/raw/master/resources/stacer_1.1.0_amd64.deb"
sudo chroot $HOME/Unity-XP/chroot sh -c "apt install -y ./stacer_1.1.0_amd64.deb";sudo rm -rfv $HOME/Unity-XP/chroot/stacer*.deb
wget -c https://github.com/rauldipeas/Unity-XP/raw/master/resources/GpuTest_Linux_x64_0.7.0.zip
sudo mkdir -pv $HOME/Unity-XP/chroot/etc/skel/.local/share/applications
sudo unzip GpuTest_Linux_x64_0.7.0.zip -d $HOME/Unity-XP/chroot/etc/skel/.local/share/
sudo wget -cO $HOME/Unity-XP/chroot/etc/skel/.local/share/applications/gputest.desktop https://github.com/rauldipeas/Unity-XP/raw/master/resources/gputest.desktop
sudo chroot $HOME/Unity-XP/chroot sh -c "wget -qO- https://raw.githubusercontent.com/Bonandry/yaru-plus/master/install.sh | sh"
sudo rm -rfv $HOME/Unity-XP/chroot/usr/share/icons/Yaru++/status/*
sudo chroot $HOME/Unity-XP/chroot sh -c "ln -sv /usr/share/icons/Papirus/22x22/panel/ /usr/share/icons/Yaru++/status/24"
sudo chroot $HOME/Unity-XP/chroot sh -c "sed -i 's/Yaru/Papirus/g' /usr/share/icons/Yaru++/index.theme"
sudo chroot $HOME/Unity-XP/chroot sh -c "git clone https://github.com/vinceliuice/vimix-gtk-themes;cd vimix-gtk-themes;./Install"
sudo chroot $HOME/Unity-XP/chroot sh -c "git clone https://github.com/vinceliuice/vimix-kde"
sudo chroot $HOME/Unity-XP/chroot sh -c "cp -rfv vimix-kde/color-schemes/Vimix* /usr/share/color-schemes/"
sudo chroot $HOME/Unity-XP/chroot sh -c "cp -rfv vimix-kde/Kvantum/Vimix* /usr/share/Kvantum/"
sudo rm -rfv $HOME/Unity-XP/chroot/vimix-gtk-themes $HOME/Unity-XP/chroot/vimix-kde
sudo chroot $HOME/Unity-XP/chroot apt install -y \
    gparted \
    ubiquity \
    ubiquity-casper \
    ubiquity-frontend-gtk \
    ubiquity-slideshow-ubuntu
sudo chroot $HOME/Unity-XP/chroot apt install -y \
    lutris \
    mesa-vulkan-drivers \
    mesa-vulkan-drivers:i386 \
    nvidia-driver-440 \
    steam-installer \
    xboxdrv
sudo chroot $HOME/Unity-XP/chroot apt install -y boot-repair
sudo rm -rfv $HOME/Unity-XP/chroot/etc/apt/sources.list.d/yannubuntu-ubuntu-boot-repair* $HOME/Unity-XP/chroot/etc/apt/trusted.gpg.d/yannubuntu-ubuntu-boot-repair*
sudo sed -i 's/\/usr\/share\/boot-sav\/x-boot-repair.png/grub-customizer/g' $HOME/Unity-XP/chroot/usr/share/applications/boot-repair.desktop
sudo chroot $HOME/Unity-XP/chroot apt autoremove --purge -y eog gnome-shell gnome-terminal libreoffice-math info mutter* nautilus vlc* xterm
sudo chroot $HOME/Unity-XP/chroot sh -c "deborphan | xargs sudo apt autoremove --purge -y"
sudo chroot $HOME/Unity-XP/chroot sh -c "deborphan | xargs sudo apt autoremove --purge -y"
sudo chroot $HOME/Unity-XP/chroot sh -c "deborphan | xargs sudo apt autoremove --purge -y"
sudo chroot $HOME/Unity-XP/chroot update-alternatives --set x-cursor-theme /etc/X11/cursors/Breeze_Snow.theme
sudo chroot $HOME/Unity-XP/chroot apt dist-upgrade -y
sudo chroot $HOME/Unity-XP/chroot apt install --reinstall resolvconf
cat <<EOF | sudo tee $HOME/Unity-XP/chroot/etc/NetworkManager/NetworkManager.conf
[main]
rc-manager=resolvconf
plugins=ifupdown,keyfile
dns=dnsmasq
[ifupdown]
managed=false
EOF
sudo chroot $HOME/Unity-XP/chroot dpkg-reconfigure network-manager
sudo chroot $HOME/Unity-XP/chroot truncate -s 0 /etc/machine-id
sudo chroot $HOME/Unity-XP/chroot rm /sbin/initctl
sudo chroot $HOME/Unity-XP/chroot dpkg-divert --rename --remove /sbin/initctl
sudo chroot $HOME/Unity-XP/chroot apt clean
sudo chroot $HOME/Unity-XP/chroot rm -rfv /tmp/* ~/.bash_history
sudo chroot $HOME/Unity-XP/chroot umount /proc
sudo chroot $HOME/Unity-XP/chroot umount /dev/pts
sudo chroot $HOME/Unity-XP/chroot sh -c "export HISTSIZE=0"
sudo umount $HOME/Unity-XP/chroot/dev
sudo umount $HOME/Unity-XP/chroot/run
sudo sed -i 's/quiet splash/quiet splash loglevel=0 logo.nologo vt.global_cursor_default=0 mitigations=off/g' $HOME/Unity-XP/chroot/etc/default/grub
echo "RESUME=none" | sudo tee $HOME/Unity-XP/chroot/etc/initramfs-tools/conf.d/resume
echo "FRAMEBUFFER=y" | sudo tee $HOME/Unity-XP/chroot/etc/initramfs-tools/conf.d/splash
sudo cp -rfv code/settings/nvidia-drm.conf $HOME/Unity-XP/chroot/lib/modprobe.d/nvidia-drm.conf
sudo cp -rfv code/settings/limits.conf $HOME/Unity-XP/chroot/etc/security/limits.d/rauldipeas.conf
sudo cp -rfv code/settings/sysctl.conf $HOME/Unity-XP/chroot/etc/sysctl.d/rauldipeas.conf
sudo cp -rfv code/settings/nvidia-composite.desktop $HOME/Unity-XP/chroot/etc/xdg/autostart/nvidia-composite.desktop
sudo cp -rfv code/settings/99qt5ct.conf $HOME/Unity-XP/chroot/etc/environment.d/99qt5ct.conf
sudo mkdir -p $HOME/Unity-XP/chroot/etc/skel/.config/{dconf,Kvantum,qt5ct,olivevideoeditor.org/Olive}
sudo cp -rfv $HOME/Unity-XP/chroot/usr/share/applications/appimaged*.desktop $HOME/Unity-XP/chroot/etc/xdg/autostart/
#Keyboard-indicator(off)
#Yaru++(icons)
#vimix-dark-laptop-ruby(gtk-theme)
#Breeze(cursor)
#Wallpaper(ubuntu-glitch-logo)
#Tilix on Nemo(open terminal here)
#Tap-to-click(touchpad)
#Unity launcher(favorites)
sudo cp -rfv code/settings/user $HOME/Unity-XP/chroot/etc/skel/.config/dconf/user
sudo cp -rfv code/settings/kvantum.kvconfig $HOME/Unity-XP/chroot/etc/skel/.config/Kvantum/kvantum.kvconfig
sudo cp -rfv code/settings/config.xml $HOME/Unity-XP/chroot/etc/skel/.config/olivevideoeditor.org/Olive/config.xml
sudo cp -rfv code/settings/qt5ct.conf $HOME/Unity-XP/chroot/etc/skel/.config/qt5ct/qt5ct.conf
sudo sed -i 's/us/br/g' $HOME/Unity-XP/chroot/etc/default/keyboard
sudo sed -i 's/inode\/directory=code.desktop;nemo.desktop;/inode\/directory=nemo.desktop;code.desktop;/g' $HOME/Unity-XP/chroot/usr/share/applications/mimeinfo.cache
sudo chroot $HOME/Unity-XP/chroot sh -c "update-initramfs -u -k \`ls -t1 /boot/vmlinuz* |  head -n 1 | sed 's/\/boot\/vmlinuz-//g'\`"
cd $HOME/Unity-XP
mkdir -p image/{casper,isolinux,install}
sudo cp chroot/boot/vmlinuz* image/casper/vmlinuz
sudo cp chroot/boot/`ls -t1 chroot/boot/ |  head -n 1` image/casper/initrd
touch image/Ubuntu
cat <<EOF > image/isolinux/grub.cfg

search --set=root --file /Ubuntu

insmod all_video

set default="0"
set timeout=15

menuentry "Unity XP(live-mode)" {
   linux /casper/vmlinuz boot=casper quiet splash loglevel=0 logo.nologo vt.global_cursor_default=0 mitigations=off locale=pt_BR ---
   initrd /casper/initrd
}
menuentry "Unity XP(live-mode)(nvidia-legacy)" {
   linux /casper/vmlinuz boot=casper quiet splash loglevel=0 logo.nologo vt.global_cursor_default=0 mitigations=off locale=pt_BR modprobe.blacklist=nvidia,nvidia_uvm,nvidia_drm,nvidia_modeset ---
   initrd /casper/initrd
}
EOF
sudo chroot chroot dpkg-query -W --showformat='${Package} ${Version}\n' | sudo tee image/casper/filesystem.manifest
sudo cp -v image/casper/filesystem.manifest image/casper/filesystem.manifest-desktop
sudo sed -i '/ubiquity/d' image/casper/filesystem.manifest-desktop
sudo sed -i '/casper/d' image/casper/filesystem.manifest-desktop
sudo sed -i '/discover/d' image/casper/filesystem.manifest-desktop
sudo sed -i '/laptop-detect/d' image/casper/filesystem.manifest-desktop
sudo sed -i '/os-prober/d' image/casper/filesystem.manifest-desktop
echo "apt-clone
archdetect-deb
boot-repair
boot-sav
boot-sav-extra
cifs-utils
cryptsetup
cryptsetup-bin
cryptsetup-initramfs
cryptsetup-run
dmeventd
dmraid
dpkg-repack
efibootmgr
finalrd
gawk
gir1.2-json-1.0
gir1.2-nm-1.0
gir1.2-nma-1.0
gir1.2-timezonemap-1.0
gir1.2-xkl-1.0
glade2script
gparted
kpartx
kpartx-boot
libaio1
libatkmm-1.6-1v5
libcairomm-1.0-1v5
libdebian-installer4
libdevmapper-event1.02.1
libdmraid1.0.0.rc16
libgtkmm-2.4-1v5
liblvm2cmd2.03
libpangomm-1.4-1v5
libreadline5
libsigsegv2
libusb-0.1-4
localechooser-data
lvm2
pastebinit
python3-icu
python3-pam
rdate
syslinux-common
thin-provisioning-tools
ubiquity
ubiquity-casper
ubiquity-frontend-gtk
ubiquity-slideshow-ubuntu
ubiquity-ubuntu-artwork
user-setup" | sudo tee image/casper/filesystem.manifest-remove
sudo mksquashfs chroot image/casper/filesystem.squashfs
printf $(sudo du -sx --block-size=1 chroot | cut -f1) > image/casper/filesystem.size
cat <<EOF > image/README.diskdefines
#define DISKNAME  Ubuntu
#define TYPE  binary
#define TYPEbinary  1
#define ARCH  amd64
#define ARCHamd64  1
#define DISKNUM  1
#define DISKNUM1  1
#define TOTALNUM  0
#define TOTALNUM0  1
EOF
cd $HOME/Unity-XP/image
grub-mkstandalone \
   --format=x86_64-efi \
   --output=isolinux/bootx64.efi \
   --locales="" \
   --fonts="" \
   "boot/grub/grub.cfg=isolinux/grub.cfg"
(
   cd isolinux && \
   dd if=/dev/zero of=efiboot.img bs=1M count=10 && \
   sudo mkfs.vfat efiboot.img && \
   mmd -i efiboot.img efi efi/boot && \
   mcopy -i efiboot.img ./bootx64.efi ::efi/boot/
)
grub-mkstandalone \
   --format=i386-pc \
   --output=isolinux/core.img \
   --install-modules="linux16 linux normal iso9660 biosdisk memdisk search tar ls" \
   --modules="linux16 linux normal iso9660 biosdisk search" \
   --locales="" \
   --fonts="" \
   "boot/grub/grub.cfg=isolinux/grub.cfg"
cat /usr/lib/grub/i386-pc/cdboot.img isolinux/core.img > isolinux/bios.img
sudo /bin/bash -c '(find . -type f -print0 | xargs -0 md5sum | grep -v "\./md5sum.txt" > md5sum.txt)'
sudo xorriso \
   -as mkisofs \
   -iso-level 3 \
   -full-iso9660-filenames \
   -volid "Ubuntu" \
   -eltorito-boot boot/grub/bios.img \
   -no-emul-boot \
   -boot-load-size 4 \
   -boot-info-table \
   --eltorito-catalog boot/grub/boot.cat \
   --grub2-boot-info \
   --grub2-mbr /usr/lib/grub/i386-pc/boot_hybrid.img \
   -eltorito-alt-boot \
   -e EFI/efiboot.img \
   -no-emul-boot \
   -append_partition 2 0xef isolinux/efiboot.img \
   -output "../unity-xp-19.10-amd64.iso" \
   -graft-points \
      "." \
      /boot/grub/bios.img=isolinux/bios.img \
      /EFI/efiboot.img=isolinux/efiboot.img
md5sum ../unity-xp-19.10-amd64.iso > ../unity-xp-19.10-amd64.md5
