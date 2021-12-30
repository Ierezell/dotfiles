#!/usr/bin/env bash

# An installer for refind-theme-regular by Munlik

SCRIPT_FOLDER="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

#Clone the theme
echo -n "Downloading rEFInd theme Regular to ${SCRIPT_FOLDER}"
rm -rf ${SCRIPT_FOLDER}/refind-theme-regular
git clone https://github.com/bobafetthotmail/refind-theme-regular.git ${SCRIPT_FOLDER}/refind-theme-regular
echo " - [DONE]"

#Useful formatting tags
bold=$(tput bold)
normal=$(tput sgr0)

#Set install path
location="/boot/EFI/refind/"
size_big="256"
size_small="96"
theme_name="dark"
theme_path="_dark"

#Uncomment relevant lines from src/theme.conf
echo -n "Generating theme file theme.conf"
cd refind-theme-regular

cp src/theme.conf theme.conf
sed -i "s/#icons_dir refind-theme-regular\/icons\/$size_big-$size_small/icons_dir refind-theme-regular\/icons\/$size_big-$size_small/" theme.conf
sed -i "s/#big_icon_size $size_big/big_icon_size $size_big/" theme.conf
sed -i "s/#small_icon_size $size_small/small_icon_size $size_small/" theme.conf
sed -i "s/#banner refind-theme-regular\/icons\/$size_big-$size_small\/bg$theme_path.png/banner refind-theme-regular\/icons\/$size_big-$size_small\/bg$theme_path.png/" theme.conf
sed -i "s/#selection_big refind-theme-regular\/icons\/$size_big-$size_small\/selection$theme_path-big.png/selection_big refind-theme-regular\/icons\/$size_big-$size_small\/selection$theme_path-big.png/" theme.conf
sed -i "s/#selection_small refind-theme-regular\/icons\/$size_big-$size_small\/selection$theme_path-small.png/selection_small refind-theme-regular\/icons\/$size_big-$size_small\/selection$theme_path-small.png/" theme.conf
cd ..
echo " - [DONE]"

#Clean up
echo -n "Removing unused directories"
rm -rf refind-theme-regular/{src,.git}
rm -rf refind-theme-regular/install.sh
echo " - [DONE]"

#Remove previous installs
echo -n "Deleting older installed versions (if any)"
sudo rm -rf "$location"{regular-theme,refind-theme-regular}
echo " - [DONE]"

#Copy theme setup folders
echo -n "Copying theme to $location"
sudo cp -r refind-theme-regular "$location"
echo " - [DONE]"

#Edit refind.conf - add new theme
echo -n "Updating ${location}refind.conf"
sudo bash -c 'echo "" >> ${location}refind.conf'
sudo bash -c 'echo "# Load rEFInd theme Regular" >> ${location}refind.conf'
sudo bash -c 'echo "include refind-theme-regular/theme.conf" >> ${location}refind.conf' 
echo " - [DONE]"
