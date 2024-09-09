sudo pacman -S  nvidia nvidia-utils grub-theme-vimix
echo "GBM_BACKEND=nvidia-drm" >> /etc/environment
echo "__GLX_VENDOR_LIBRARY_NAME=nvidia" >> /etc/environment

vim /etc/default/grub
# >> GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"
# >> GRUB_GFXMODE=1920x1080
# >> GRUB_THEME="/usr/share/grub/themes/Vimix/theme.txt"
sudo grub-mkconfig -o /boot/grub/grub.cfg


vim /etc/mkinitcpio.conf
# >> MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
echo "options nvidia_drm modeset=1 fbdev=1" >> /etc/modprobe.d/nvidia.conf
sudo mkinitcpio -P

sudo pacman -S \
    xorg-xwayland qt5-wayland qt6-wayland glfw-wayland \
    hyprland hyprpaper hyprlock \
    waybar kitty wofi playerctl mako \
    fcitx5 fcitx5-configtool fcitx5-chiness-addons fcitx5-material-color rime-pinyin-zhwiki \

echo "GTK_IM_MODULE=fcitx" >> /etc/environment
echo "QT_IM_MODULE=fcitx" >> /etc/environment
echo "XMODIFIERS=@im=fcitx" >> /etc/enviroment
