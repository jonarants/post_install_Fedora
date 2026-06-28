#!/bin/bash


echo "Installing google chrome"
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager setopt google-chrome.enabled=1
sudo dnf install google-chrome-stable
echo "Process completed"