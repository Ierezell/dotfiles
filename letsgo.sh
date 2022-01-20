SCRIPT_FOLDER="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Install yay
echo "Installing Yay"
${SCRIPT_FOLDER}/install_yay.sh
yay -Syu
echo "Yay Installed"

# Install all needed packages 
echo "Installing packages"
yay -S --needed - < packages.txt
yay -S --needed - < work_packages.txt
echo "Done installing packages"

# Make Zsh default
echo "changing shell"
sudo chsh $USER -s /usr/bin/zsh
echo "shell changed"

# For utc time in dual boots
echo "Time for dual boot"
sudo timedatectl set-local-rtc 1 --adjust-system-clock
echo "Changed dual boot time"

# Link all the config files as symlinks
echo "Linking config"
${SCRIPT_FOLDER}/link_config.sh
echo "Config Linked"

# Enable AutoLogin 
# echo "Enabling autologin"
# sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
# sudo rm -f /etc/systemd/system/getty@tty1.service.d/override.conf
# sudo bash -c 'echo "[Service]" > /etc/systemd/system/getty@tty1.service.d/override.conf'
# sudo bash -c 'echo "ExecStart=-/usr/bin/agetty --autologin ${USER} --noclear %I $TERM" >> /etc/systemd/system/getty@tty1.service.d/override.conf'
# echo "Autologin enabled"

# Enable services 
echo "Enabling services"
sudo systemctl enable tlp
sudo systemctl enable bluetooth

sudo bash -c 'echo "START_CHARGE_THRESH_BAT0=75" > /etc/tlp.conf'
sudo bash -c 'echo "STOP_CHARGE_THRESH_BAT0=80" >> /etc/tlp.conf'
echo "Services enabled"

echo "Done and ready to use !"
