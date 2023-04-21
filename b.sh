#!/bin/bash

# Function to clone git repository
clone_repo() {
    read -p "Enter the Git repository link: " repo_link
    git clone $repo_link || { echo "Failed to clone repository. Exiting..."; exit 1; }
    echo "Clone successful."
}

# Function to login to GitHub
git_login() {
    read -p "Enter GitHub username: " username
    read -s -p "Enter GitHub access token: " access_token
    echo ""
    echo "Logging in to GitHub..."
    git config --global user.name "$username"
    git config --global user.password "$access_token"
    echo "Login successful."
}

# Function to install all packages in the repository
install_packages() {
    cd ~/git_repo
    echo "Installing packages..."
    sudo apt update
    sudo apt install -y $(grep -vE "^\s*#" ./package-list.txt | tr "\n" " ")
    echo "Package installation successful."
}

# Function to display all git repositories and prompt user to select one
select_repo() {
    cd ~/git_repo
    echo "Available repositories:"
    select repo_name in */; do
        if [ ! -z "$repo_name" ]; then
            cd "$repo_name"
            break
        fi
    done
}

# Display menu and prompt user for input
echo "========================="
echo "  Tool Ubuntu + NodeJS Setup   "
echo "========================="
echo "1. Clone Git repository"
echo "2. Install packages"
echo "3. Select repository"
echo "4. Exit"
echo "========================="
read -p "Enter your choice: " choice

# Handle user input
handleInput(){
case $choice in
    1) clone_repo ;;
    2) install_packages ;;
    3) select_repo ;;
    4) exit ;;
    *) echo "Invalid choice. Exiting..." ;;
esac
}
handleInput
