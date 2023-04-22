<?php
// Kiểm tra xem Termux đã được cài đặt hay chưa
if (!is_dir("/data/data/com.termux/files")) {
    echo "Termux is not installed. Please install Termux and try again.\n";
    exit();
}

// Cài đặt các gói cần thiết
system('pkg update && pkg upgrade -y && pkg install -y proot wget curl');

// Tạo thư mục và tải bash script của Ubuntu từ GitHub
system('mkdir ~/ubuntu && cd ~/ubuntu && curl https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh > ubuntu.sh');

// Chạy bash script của Ubuntu và cài đặt Node.js và Git
system('cd ~/ubuntu && bash ubuntu.sh && sudo apt update && sudo apt install -y nodejs git');

echo "Ubuntu, Node.js, and Git have been installed successfully.\n";
?>
