#!/bin/bash

# Check the Linux distribution
if command -v lsb_release >/dev/null 2>&1; then
    distro=$(lsb_release -si)
    case $distro in
        Ubuntu)
            package_manager="apt-get"
            ;;
        Debian)
            package_manager="apt-get"
            ;;
        CentOS)
            package_manager="yum"
            ;;
        Fedora)
            package_manager="dnf"
            ;;
        *)
            echo "Unsupported distribution: $distro"
            exit 1
            ;;
    esac
else
    echo "lsb_release command not found. Unable to determine the distribution."
    exit 1
fi

# Package variables
PACKAGES="source-highlight htop vim-nox build-essential nmap"

# Install packages
echo "Installing packages using $package_manager..."
sudo $package_manager install -y $PACKAGES

echo "Package installation completed."


