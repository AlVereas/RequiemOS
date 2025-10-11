#!/bin/bash
set -e

# -----------------------------
# 1. Update system
# -----------------------------
sudo pacman -Syu --noconfirm || true

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
cp -r dotfiles/* ~/.config/
cp dotfiles/.zshrc ~/

# -----------------------------
# 6. Enable services
# -----------------------------
systemctl --user enable pipewire wireplumber pipewire-pulse

echo "Hyprland setup complete! Reboot and start Hyprland."
