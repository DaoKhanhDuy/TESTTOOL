
# Cài đặt gói cần thiết để cài Ubuntu
pkg install proot -y
pkg install wget -y

# Tải và cài đặt Ubuntu
cd ~ && mkdir ubuntu && cd ubuntu && wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Ubuntu20/ubuntu20.sh -O ubuntu.sh && chmod +x ubuntu.sh && ./ubuntu.sh
# Truy cập vào Ubuntu và cài đặt Node.js v16 và Git
./start-ubuntu.sh
apt-get update && apt-get upgrade -y
apt-get install curl -y
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs git

# Tắt Ubuntu
exit

# Quay lại thư mục home và khởi động lại Termux
cd ~
exit
