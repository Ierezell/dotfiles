if ! command -v yay &> /dev/null
then
	cd ~ 
	git clone https://aur.archlinux.org/yay.git
	cd yay 
        makepkg -si 
	cd ~
fi
