#!/bin/bash

# Prompt for username
read -p "Enter the new username: " username

# Create the user
sudo adduser $username

# Add the user to the sudo group
sudo usermod -aG sudo $username

echo "User $username created and added to the sudo group."

# Check the package manager
if command -v apt-get >/dev/null 2>&1; then
    package_manager="apt-get"
    PACKAGES="htop vim nmap fail2ban"
elif command -v yum >/dev/null 2>&1; then
    package_manager="yum"
    PACKAGES="htop vim-enhanced nmap fail2ban"
elif command -v dnf >/dev/null 2>&1; then
    package_manager="dnf"
    dnf update -y && dnf install -y epel-release
    PACKAGES="htop vim-enhanced nmap fail2ban"
else
    echo "Unsupported distribution. Unable to determine the package manager."
    exit 1
fi

# Install packages
echo "Installing packages using $package_manager..."
sudo $package_manager install -y $PACKAGES

echo "Package installation completed."

