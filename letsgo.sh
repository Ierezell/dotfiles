SCRIPT_FOLDER="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Install yay
${SCRIPT_FOLDER}/install_yay.sh

# Install all needed packages 
yay -S --needed - < packages.txt

# Make Zsh default
sudo chsh $USER -s /usr/bin/zsh

# For utc time in dual boots
sudo timedatectl set-local-rtc 1 --adjust-system-clock

# Link all the config files as symlinks
${SCRIPT_FOLDER}/link_config.sh

# Enable AutoLogin 
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
sudo rm -f /etc/systemd/system/getty@tty1.service.d/override.conf
sudo bash -c 'echo "[Service]" > /etc/systemd/system/getty@tty1.service.d/override.conf'
sudo bash -c 'echo "ExecStart=-/usr/bin/agetty --autologin ${USER} --noclear %I $TERM" >> /etc/systemd/system/getty@tty1.service.d/override.conf'

# Enable services 
sudo systemctl enable tlp
sudo bash -c 'echo "START_CHARGE_THRESH_BAT0=75" > /etc/tlp.conf'
sudo bash -c 'echo "STOP_CHARGE_THRESH_BAT0=80" >> /etc/tlp.conf'
