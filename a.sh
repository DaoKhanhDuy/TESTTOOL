#!/bin/bash

PS3='Vui lòng chọn một trong các lựa chọn bên dưới:'
options=("Git clone và đăng nhập" "Cài đặt package" "Hiển thị danh sách các thư mục" "Thoát")
select opt in "${options[@]}"
do
    case $opt in
        "Git clone và đăng nhập")
            echo "Bạn đã chọn Git clone và đăng nhập"
            read -p "Vui lòng nhập link Github: " github_link
            if [[ $github_link == *"github.com"* ]]
            then
                git clone $github_link
                echo "Clone thành công!"
            else
                echo "Link Github không hợp lệ"
            fi
            ;;
        "Cài đặt package")
            echo "Bạn đã chọn cài đặt package"
            read -p "Vui lòng nhập đường dẫn đến thư mục cần cài đặt: " package_path
            cd $package_path
            npm install
            echo "Cài đặt thành công!"
            ;;
        "Hiển thị danh sách các thư mục")
            echo "Bạn đã chọn hiển thị danh sách các thư mục"
            folders=($(find . -maxdepth 1 -type d))
            for i in "${!folders[@]}"; do
                printf "%s\t%s\n" "$i" "${folders[$i]}"
            done
            read -p "Vui lòng nhập số thư mục cần truy cập: " folder_index
            if [[ "$folder_index" =~ ^[0-9]+$ ]]
            then
                selected_folder="${folders[$folder_index]}"
                if [[ -d $selected_folder ]]
                then
                    cd $selected_folder
                    echo "Bạn đã truy cập vào thư mục $selected_folder"
                else
                    echo "Số thư mục không hợp lệ"
                fi
            else
                echo "Số thư mục không hợp lệ"
            fi
            ;;
        "Thoát")
            echo "Bạn đã chọn thoát"
            break
            ;;
        *) 
            echo "Lựa chọn không hợp lệ. Hãy chọn lại."
            ;;
    esac
done
