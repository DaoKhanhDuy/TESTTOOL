#!/bin/bash

# Install Ubuntu
curl -fsSL https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Ubuntu/ubuntu.sh | bash
./start-ubuntu.sh

# Install Node.js and Git
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs git
