#!/bin/bash

set -e  # Exit on error

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Updating AUR packages..."
yay -Syu --noconfirm

echo "Cleaning package cache..."
sudo paccache -r

echo "Removing orphaned packages.."
orphans=$(pacman -Qtdq || true)

if [ -n "$orphans" ]; then
    sudo pacman -Rns --noconfirm $orphans
else
    echo "No orphaned packages found..."
fi

echo "Removing unused cache..."
# Uncomment next line if you want FULL cache wipe
# sudo pacman -Scc --noconfirm

echo "System maintenance complete!"
