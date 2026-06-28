#!/bin/bash

echo "Installing steam"
sudo dnf config-manager setopt rpmfusion-nonfree-steam.enabled=1
sudo dnf install steam -y
echo "Process completed"
