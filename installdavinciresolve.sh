#!/bin/bash

echo "Installing Davinci Resolve with podman"
sudo dnf install distrobox podman lshw git
git clone https://github.com/zelikos/davincibox.git
cd davincibox
mv DaVinci_Resolve_21.0.1_Linux.run /davincibox/Davinci_Resolve_21.0.1_Linux.run
./davincibox/setup.sh DaVinci_Resolve_21.0.1_Linux.run 
