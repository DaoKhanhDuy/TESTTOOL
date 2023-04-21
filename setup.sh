#!/bin/bash

# Lấy menu từ Github
curl -s https://raw.githubusercontent.com/username/repo/main/menu.sh > menu.sh

# Cài đặt môi trường Ubuntu
sudo apt-get update
sudo apt-get install -y ubuntu-desktop

# Cài đặt NodeJS v16
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Hiển thị menu và chờ người dùng nhập lựa chọn
while true
do
    clear
    echo "===================="
    echo "       MENU"
    echo "===================="
    echo "1. Nhập link Git clone từ Github"
    echo "2. Cài đặt các package từ thư mục vừa clone"
    echo "3. Viết một chương trình hoàn chỉnh có màu chữ và đẹp"
    echo "0. Thoát"
    echo "===================="
    read -p "Nhập lựa chọn của bạn: " choice

    case $choice in
        1)
            read -p "Nhập link Git clone: " giturl
            git clone $giturl
            ;;
        2)
            cd ~/repo
            npm install
            ;;
        3)
            echo "Đang xây dựng chương trình..."
            ;;
        0)
            echo "Tạm biệt!"
            exit 0
            ;;
        *)
            echo "Lựa chọn không hợp lệ!"
            read -p "Nhấn phím Enter để tiếp tục..."
            ;;
    esac
done
