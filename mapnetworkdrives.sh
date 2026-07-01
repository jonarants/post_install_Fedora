#!/bin/bash

echo "Creating the mountpoints"

sudo mkdir -p /mnt/unraid/p
sudo mkdir -p /mnt/SSD960A
sudo mkdir -p /mnt/SSD2TB 
sudo mkdir -p /mnt/SSD960B
sudo mkdir -p /mnt/nvme240
sudo mkdir -p /mnt/unraid/production
sudo mkdir -p /mnt/unraid/appdata   
sudo mkdir -p /mnt/unraid/media     
sudo mkdir -p /mnt/unraid/work      
sudo mkdir -p /mnt/unraid/software  

echo "Rewriting fstab "

sudo cat << 'EOF' > /etc/fstab
#
# /etc/fstab
# Created by anaconda on Sat Jun 27 01:00:49 2026
#
# Accessible filesystems, by reference, are maintained under '/dev/disk/'.
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info.
#
# After editing this file, run 'systemctl daemon-reload' to update systemd
# units generated from this file.
#
UUID=343f02f2-c727-48ce-941c-f2812496b827   /               btrfs          subvol=root,compress=zstd:1,x-systemd.device-timeout=0   0 0
UUID=46c12b93-f9f0-4bfa-acd5-205278ee3986   /boot           ext4           defaults                                                 1 2
UUID=053B-9982                              /boot/efi       vfat           umask=0077,shortname=winnt                               0 2
UUID=343f02f2-c727-48ce-941c-f2812496b827   /home           btrfs          subvol=home,compress=zstd:1,x-systemd.device-timeout=0   0 0
UUID=22550b54-96e5-4653-b618-8916553b4608   /mnt/SSD960A    ext4           nofail                                                   0 0
UUID=23f8f1aa-3479-4cdf-a7aa-f883e810dcb5   /mnt/SSD2TB     ext4           nofail                                                   0 0
UUID=b5861324-bb85-4a64-8f12-5588b5df5ab6   /mnt/SSD960B    ext4           nofail                                                   0 0
UUID=d8de126e-b3b9-4b7f-8501-02cba637994d   /mnt/nvme240    ext4           nofail                                                   0 0
//10.10.10.4/production/                    /mnt/unraid/production     cifs credentials=/etc/smbcredentials/10.10.10.4.cred,uid=1000,gid=1000,file_mode=0664,dir_mode=0775,iocharset=utf8,x-systemd.automount,_netdev,nofail 0 0
//10.10.10.4/appdata/                       /mnt/unraid/appdata        cifs credentials=/etc/smbcredentials/10.10.10.4.cred,uid=1000,gid=1000,file_mode=0664,dir_mode=0775,iocharset=utf8,x-systemd.automount,_netdev,nofail 0 0
//10.10.10.4/Media/                         /mnt/unraid/media          cifs credentials=/etc/smbcredentials/10.10.10.4.cred,uid=1000,gid=1000,file_mode=0664,dir_mode=0775,iocharset=utf8,x-systemd.automount,_netdev,nofail 0 0
//10.10.10.4/work/                          /mnt/unraid/work           cifs credentials=/etc/smbcredentials/10.10.10.4.cred,uid=1000,gid=1000,file_mode=0664,dir_mode=0775,iocharset=utf8,x-systemd.automount,_netdev,nofail 0 0
//10.10.10.4/software/                      /mnt/unraid/software       cifs credentials=/etc/smbcredentials/10.10.10.4.cred,uid=1000,gid=1000,file_mode=0664,dir_mode=0775,iocharset=utf8,x-systemd.automount,_netdev,nofail 0 0
EOF

cat /etc/fstab

sudo systemctl daemon-reload
sudo mount -a

