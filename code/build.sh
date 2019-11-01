#!/bin/bash
sudo apt install -y debootstrap xorriso
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
sudo chroot $HOME/Unity-XP/chroot mount none -t proc /proc
sudo chroot $HOME/Unity-XP/chroot mount none -t devpts /dev/pts
sudo chroot $HOME/Unity-XP/chroot sh -c "export HOME=/root"
echo "Unity-XP" | sudo tee $HOME/Unity-XP/chroot/etc/hostname
cat <<EOF | sudo tee $HOME/Unity-XP/chroot/etc/apt/sources.list
deb http://br.archive.ubuntu.com/ubuntu/ eoan main restricted universe multiverse
deb http://br.archive.ubuntu.com/ubuntu/ eoan-security main restricted universe multiverse
deb http://br.archive.ubuntu.com/ubuntu/ eoan-updates main restricted universe multiverse
EOF
sudo chroot $HOME/Unity-XP/chroot dpkg --add-architecture i386
sudo chroot $HOME/Unity-XP/chroot apt update
sudo chroot $HOME/Unity-XP/chroot apt install -y software-properties-common
sudo chroot $HOME/Unity-XP/chroot add-apt-repository -y ppa:damentz/liquorix
sudo chroot $HOME/Unity-XP/chroot apt install -y systemd-sysv
sudo chroot $HOME/Unity-XP/chroot sh -c "dbus-uuidgen > /etc/machine-id"
sudo chroot $HOME/Unity-XP/chroot ln -fs /etc/machine-id /var/lib/dbus/machine-id
sudo chroot $HOME/Unity-XP/chroot dpkg-divert --local --rename --add /sbin/initctl
sudo chroot $HOME/Unity-XP/chroot ln -s /bin/true /sbin/initctl
echo 'Package: tcpdump
Pin: release *
Pin-Priority: -1

Package: tcpdump:i386
Pin: release *
Pin-Priority: -1' | sudo tee $HOME/Unity-XP/chroot/etc/apt/preferences.d/tcpdump
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
    linux-headers-liquorix-amd64 \
    linux-image-liquorix-amd64 \
    locales \
    lupin-casper \
    net-tools \
    network-manager \
    os-prober \
    resolvconf \
    ubuntu-standard \
    wireless-tools
sudo rm -rfv $HOME/Unity-XP/chroot/etc/apt/preferences.d/tcpdump
sudo chroot $HOME/Unity-XP/chroot apt install -y --no-install-recommends \
    gnome-mpv \
    ubuntu-unity-desktop
sudo chroot $HOME/Unity-XP/chroot apt install -y \
    breeze-cursor-theme \
    compizconfig-settings-manager \
    deluged \
    deluge-gtk \
    epiphany-browser \
    fonts-ubuntu \
    gimp \
    git \
    gnome-themes-extra \
    gthumb \
    indicator-application \
    indicator-appmenu \
    indicator-session \
    nemo \
    network-manager-gnome \
    papirus-icon-theme \
    plymouth-theme-ubuntu-logo \
    synaptic \
    telegram-desktop \
    tilix \
    timeshift
sudo chroot $HOME/Unity-XP/chroot sh -c "wget -qO- https://raw.githubusercontent.com/Bonandry/yaru-plus/master/install.sh | sh"
sudo sed -i 's/Humanity/Papirus,Humanity/g' $HOME/Unity-XP/chroot/usr/share/icons/Yaru++/index.theme
sudo sed -i 's/Humanity/Papirus-Dark,Humanity/g' $HOME/Unity-XP/chroot/usr/share/icons/Yaru++-Dark/index.theme
sudo chroot $HOME/Unity-XP/chroot sh -c "git clone https://github.com/vinceliuice/vimix-gtk-themes;cd vimix-gtk-themes;./Install"
sudo rm -rfv $HOME/Unity-XP/chroot/vimix-gtk-themes
sudo chroot $HOME/Unity-XP/chroot apt install -y \
    ubiquity \
    ubiquity-casper \
    ubiquity-frontend-gtk \
    ubiquity-slideshow-ubuntu
sudo chroot $HOME/Unity-XP/chroot apt autoremove --purge -y eog nautilus gnome-terminal info xterm
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
sudo chroot $HOME/Unity-XP/chroot rm -rf /tmp/* ~/.bash_history
sudo chroot $HOME/Unity-XP/chroot umount /proc
sudo chroot $HOME/Unity-XP/chroot umount /dev/pts
sudo chroot $HOME/Unity-XP/chroot sh -c "export HISTSIZE=0"
sudo umount $HOME/Unity-XP/chroot/dev
sudo umount $HOME/Unity-XP/chroot/run
sudo cp -rfv settings/nvidia-drm.conf $HOME/Unity-XP/chroot/lib/modprobe.d/nvidia-drm.conf
sudo cp -rfv settings/limits.conf $HOME/Unity-XP/chroot/etc/security/limits.d/rauldipeas.conf
sudo cp -rfv settings/sysctl.conf $HOME/Unity-XP/chroot/etc/sysctl.d/rauldipeas.conf
sudo cp -rfv settings/nvidia-composite.desktop $HOME/Unity-XP/chroot/etc/xdg/autostart/nvidia-composite.desktop
sudo mkdir -p $HOME/Unity-XP/chroot/etc/skel/.config/dconf
sudo cp -rfv settings/user $HOME/Unity-XP/chroot/etc/skel/.config/dconf/user
#keyboard-indicator(off) #Yaru++-Dark(icons) #Vimix-Dark-Laptop-Ruby(gtk-theme) #Wallpaper(ubuntu-glitch-logo)
sudo mkdir -p $HOME/Unity-XP/chroot/etc/X11/xorg.conf.d
sudo cp -rfv settings/20-amd.conf $HOME/Unity-XP/chroot/etc/X11/xorg.conf.d/20-amd.conf
sudo sed -i 's/us/br/g' $HOME/Unity-XP/chroot/etc/default/keyboard
cd $HOME/Unity-XP
mkdir -p image/{casper,isolinux,install}
sudo cp chroot/boot/vmlinuz* image/casper/vmlinuz
sudo cp chroot/boot/`ls -t1 chroot/boot |  head -n 1` image/casper/initrd
touch image/Ubuntu
cat <<EOF > image/isolinux/grub.cfg

search --set=root --file /Ubuntu

insmod all_video

set default="0"
set timeout=30

menuentry "Iniciar o Ubuntu" {
   linux /casper/vmlinuz boot=casper quiet splash loglevel=0 logo.nologo vt.global_cursor_default=0 mitigations=off locale=pt_BR ---
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
cifs-utils
cryptsetup
cryptsetup-bin
cryptsetup-initramfs
cryptsetup-run
dmeventd
dmraid
dpkg-repack
finalrd
gir1.2-timezonemap-1.0
gir1.2-xkl-1.0
kpartx
kpartx-boot
libaio1
libdebian-installer4
libdevmapper-event1.02.1
libdmraid1.0.0.rc16
liblvm2cmd2.03
libreadline5
libusb-0.1-4
localechooser-data
lvm2
python3-icu
python3-pam
rdate
thin-provisioning-tools
user-setup" image/casper/filesystem.manifest-remove
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
sudo apt autoremove --purge -y debootstrap libburn4 libisoburn1 libisofs6 libjte1 xorriso
