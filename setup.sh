#!/bin/bash

# Hiển thị menu
echo "1. Git clone từ GitHub"
echo "2. Cài đặt các package"
echo "3. Hiển thị các thư mục đã git"

# Đọc lựa chọn từ người dùng
read choice

# Xử lý lựa chọn của người dùng
case $choice in
  1)
    echo "Bạn đã chọn Git clone từ GitHub"
    # Thực hiện các lệnh để git clone từ GitHub
    ;;
  2)
    echo "Bạn đã chọn cài đặt các package"
    # Thực hiện các lệnh để cài đặt các package
    ;;
  3)
    echo "Bạn đã chọn hiển thị các thư mục đã git"
    # Thực hiện các lệnh để hiển thị các thư mục đã git
    ;;
  *)
    echo "Lựa chọn không hợp lệ. Vui lòng chọn lại."
    # Thực hiện các lệnh để thông báo lựa chọn không hợp lệ
    ;;
esac
