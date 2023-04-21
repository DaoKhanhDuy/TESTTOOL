#!/bin/bash

# Cài đặt Ubuntu trên Termux
curl -sLO https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh && chmod +x ubuntu.sh && ./ubuntu.sh

# Cài đặt NodeJS v16, PHP và Wget
curl -sL https://deb.nodesource.com/setup_16.x | bash -
pkg install nodejs php wget
