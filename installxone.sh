#!/bin/bash

echo "Installing xbox dongle with XONE"
sudo dnf install dkms make kernel-devel-$(uname -r) kernel-headers git cabextract

if ! sudo mokutil --list-enrolled 2>/dev/null | grep -q "DKMS"; then
    echo "Enrolling DKMS MOK key for Secure Boot..."
    sudo mokutil --import /var/lib/dkms/mok.pub
    echo "IMPORTANT: Reboot and enroll the key in the MOK Manager blue screen, then re-run this script."
    exit 0
fi

git clone https://github.com/medusalix/xone
cd xone
sudo sh install.sh --release
sudo xone-get-firmware.sh
sudo rm -rf xone
echo "Process completed"
