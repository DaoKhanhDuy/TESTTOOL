<?php
// Kiểm tra xem script đang chạy ở quyền root hay không
if (posix_getuid() !== 0) {
    die("This script must be run as root.\n");
}

// Thực hiện cài đặt Ubuntu
system('pkg update && pkg upgrade -y && pkg install wget -y && wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Ubuntu20/ubuntu20.sh -O ubuntu.sh && chmod +x ubuntu.sh && bash ubuntu.sh');

// Truy cập vào Ubuntu và cài đặt Node.js v16
system('bash ~/ubuntu20/start-ubuntu20.sh && sudo apt-get update && sudo apt-get install -y curl && curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && sudo apt-get install -y nodejs');
