#!/bin/bash

# Check if Ubuntu is installed, if not, install it
if ! command -v proot &> /dev/null; then
    echo "Installing Ubuntu..."
    apt update && apt upgrade -y && apt install -y proot wget tar
    wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Ubuntu20/ubuntu20.sh -O ubuntu20.sh
    bash ubuntu20.sh
fi

# Check if NodeJS v16 is installed, if not, install it
if ! command -v node &> /dev/null; then
    echo "Installing NodeJS v16..."
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Create directory to store the program
mkdir -p ~/myapp

# Display the menu options
while true; do
    echo "------ MENU ------"
    echo "1. Enter Github link to clone"
    echo "2. Load all packages in the directory"
    echo "3. Run npm start"
    echo "4. Exit program"
    read -p "Enter your choice: " choice
    case $choice in
        1)
            read -p "Enter Github link: " github_link
            if [[ $github_link == *".git"* ]]; then
                git clone $github_link ~/myapp || (read -p "Enter your Github username: " username && read -p "Enter your access token: " access_token && git clone https://$username:$access_token@$github_link ~/myapp) || (echo "Error cloning Github repository, please check the link and access rights." && exit)
            else
                echo "Invalid Github link, please enter a link with .git extension."
            fi
            ;;
        2)
            if [ ! -d ~/myapp ]; then
                echo "No directory containing the program, please clone first."
            else
                cd ~/myapp
                npm install || echo "Error loading packages, please check again." 
                cd ~
            fi
            ;;
        3)
            if [ ! -d ~/myapp ]; then
                echo "No directory containing the program, please clone and load packages first."
            else
                cd ~/myapp
                npm start || echo "Error running program, please check again."
                cd ~
            fi
            ;;
        4)
            echo "Goodbye!"
            exit
            ;;
        *)
            echo "Invalid choice, please choose again."
            ;;
    esac
done
