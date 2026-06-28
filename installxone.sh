#!/bin/bash

echo "Installing xbox dongle with XONE"
sudo dnf install dkms make kernel-devel-$(uname -r) kernel-headers git cabextract
git clone https://github.com/medusalix/xone
sudo sh install.sh --release
sudo xone-get-firmware.sh
sudo rm -rf xone
echo "Process completed"