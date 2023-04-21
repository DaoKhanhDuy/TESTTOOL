#!/bin/bash

# Kiểm tra xem đã cài đặt Ubuntu chưa
if ! command -v proot &> /dev/null; then
    echo "Đang cài đặt Ubuntu..."
    apt update && apt upgrade -y && apt install -y proot wget tar
    wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Ubuntu20/ubuntu20.sh -O ubuntu20.sh
    bash ubuntu20.sh
fi

# Kiểm tra xem đã cài đặt NodeJS chưa
if ! command -v node &> /dev/null; then
    echo "Đang cài đặt NodeJS..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
    apt-get install -y nodejs
fi

# Tạo thư mục để lưu trữ chương trình
mkdir -p ~/myapp

# Hiển thị menu lựa chọn
while true; do
    clear
    echo "------ MENU ------"
    echo "1. Nhập link Github để git clone"
    echo "2. Load toàn bộ package trong thư mục"
    echo "3. Chạy npm start"
    echo "4. Thoát chương trình"
    read -p "Nhập lựa chọn của bạn: " choice
    case $choice in
        1)
            read -p "Nhập link Github: " github_link
            if [[ $github_link == *".git"* ]]; then
                read -p "Nhập username Github: " github_username
                read -p "Nhập access token Github: " github_access_token
                git clone https://$github_username:$github_access_token@$github_link ~/myapp || (echo "Lỗi khi git clone, vui lòng kiểm tra lại đường dẫn và quyền truy cập." && exit)
            else
                echo "Link Github không hợp lệ, vui lòng nhập link có đuôi .git."
            fi
            ;;
        2)
            if [ ! -d ~/myapp ]; then
                echo "Chưa có thư mục chứa chương trình, vui lòng git clone trước."
            else
                cd ~/myapp
                npm install || echo "Lỗi khi load package, vui lòng kiểm tra lại." 
                cd ~
            fi
            ;;
        3)
            if [ ! -d ~/myapp ]; then
                echo "Chưa có thư mục chứa chương trình, vui lòng git clone và load package trước."
            else
                cd ~/myapp
                npm start || echo "Lỗi khi chạy chương trình, vui lòng kiểm tra lại."
                cd ~
            fi
            ;;
        4)
            echo "Tạm biệt!"
            exit
            ;;
        *)
            echo "Lựa chọn không hợp lệ, vui lòng chọn lại."
            ;;
    esac
    read -p "Nhấn Enter để tiếp tục..." -n1 -s
done
