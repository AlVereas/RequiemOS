#!/bin/bash
set -e

# -----------------------------
# 1. Update system
# -----------------------------
sudo pacman -Syu --noconfirm

# -----------------------------
# 2. Install pacman packages
# -----------------------------
echo "Installing pacman packages..."
xargs -a packages/pacman.txt sudo pacman -S --noconfirm

# -----------------------------
# 3. Install yay (AUR helper)
# -----------------------------
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd ~
    rm -rf /tmp/yay
fi

# -----------------------------
# 4. Install AUR packages
# -----------------------------
echo "Installing AUR packages..."
xargs -a packages/aur.txt yay -S --noconfirm

# -----------------------------
# 5. Copy dotfiles
# -----------------------------
echo "Setting up dotfiles..."
cp -r dotfiles/.* ~ 2>/dev/null || true

# -----------------------------
# 6. Optional scripts
# -----------------------------
if [ -f scripts/setup.sh ]; then
    bash scripts/setup.sh
fi

echo "Setup complete! Please restart your terminal."
