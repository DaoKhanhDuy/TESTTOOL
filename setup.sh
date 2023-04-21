#!/bin/bash

# 1. Tự động cài đặt Ubuntu
sudo apt-get update
sudo apt-get upgrade -y

# 2. Cài đặt Node.js v16 trên Ubuntu
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# 3. Git clone từ Github
echo "Nhập đường dẫn Github:"
read github_url
git clone $github_url

# Kiểm tra xem repo có private không
if [[ $(git config --get remote.origin.url) == *"https://"* ]]; then
  echo "Nhập tên người dùng Github:"
  read github_username
  echo "Nhập access token Github:"
  read github_token
  git config --global credential.helper store
  git config --global user.username $github_username
  git config --global user.password $github_token
fi

# 4. Tự động cài các package
cd <tên thư mục vừa clone>
npm install

# 5. Chạy file bằng npm start
npm start
