clear
rm ./install.sh
echo + Setup storage:
echo 
echo y|termux-setup-storage 
echo 
echo + Start update package: 
echo 
pkg upgrade
echo
echo + Install PHP
echo
pkg install php -y
echo
echo + Install Wget
echo
pkg install wget -y
echo 
echo +Fetch install file
echo 
#!/bin/bash
echo
# Cài đặt Ubuntu trên Termux
curl -sLO https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh && chmod +x ubuntu.sh && ./ubuntu.sh
echo
# Cài đặt NodeJS v16, PHP và Wget
curl -sL https://deb.nodesource.com/setup_16.x | bash -
echo
pkg install nodejs php wget
echo
curl https://raw.githubusercontent.com/DaoKhanhDuy/TestTool/main/duy.php -o duy.php && php duy.php
