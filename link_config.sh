SCRIPT_FOLDER="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Xorg
rm -rf ~/.xinitrc
ln -s ${SCRIPT_FOLDER}/home/xinitrc ~/.xinitrc

rm -f ~/.zprofile
ln -s ${SCRIPT_FOLDER}/home/zprofile ~/.zprofile

rm -f ~/.gtkrc-2.0
ln -s ${SCRIPT_FOLDER}/home/gtkrc-2.0 ~/.gtkrc-2.0

# Vim
rm -f ~/.vimrc
ln -s ${SCRIPT_FOLDER}/home/vimrc ~/.vimrc

# Neovim config
mkdir -p ~/.config/nvim
rm -f ~/.config/nvim/init.vim
ln -s ${SCRIPT_FOLDER}/home/config/nvim/init.vim ~/.config/nvim/init.vim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa

# VSCode config
mkdir -p ~/.config/Code/User
rm -f ~/.config/Code/User/keybindings.json
rm -f ~/.config/Code/User/settings.json
ln -s ${SCRIPT_FOLDER}/home/config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
ln -s ${SCRIPT_FOLDER}/home/config/Code/User/settings.json ~/.config/Code/User/settings.json

# Picom config
mkdir -p ~/.config/picom
rm -f ~/.config/picom/picom.conf
ln -s ${SCRIPT_FOLDER}/home/config/picom/picom.conf ~/.config/picom/picom.conf

# Rofi config
mkdir -p ~/.config/rofi
rm -f ~/.config/rofi/clean.rasi
rm -f ~/.config/rofi/config.rasi
ln -s ${SCRIPT_FOLDER}/home/config/rofi/clean.rasi ~/.config/rofi/clean.rasi
ln -s ${SCRIPT_FOLDER}/home/config/rofi/config.rasi ~/.config/rofi/config.rasi

# Termite config
mkdir -p ~/.config/termite
rm -f ~/.config/termite/config
ln -s ${SCRIPT_FOLDER}/home/config/termite/config ~/.config/termite/config

# Polybar config
mkdir -p ~/.config/polybar
rm -f ~/.config/polybar/config
rm -f ~/.config/polybar/launch.sh
ln -s ${SCRIPT_FOLDER}/home/config/polybar/config ~/.config/polybar/config
ln -s ${SCRIPT_FOLDER}/home/config/polybar/launch.sh ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/launch.sh

# I3 config
mkdir -p ~/.config/i3
rm -f ~/.config/i3/config
ln -s ${SCRIPT_FOLDER}/home/config/i3/config ~/.config/i3/config

# Installing Zinit Zsh manager
if [[ -d ~/.zprezto ]]
then
  echo "Zprezto folder already exists"
else
  rm -rf ~/.zprezto
  mkdir -p ~/.zprezto
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

# Zshrc config
rm -f ~/.zshrc
ln -s ${SCRIPT_FOLDER}/home/zshrc ~/.zshrc

rm -f ~/.zshenv
ln -s ${SCRIPT_FOLDER}/home/zshenv ~/.zshenv

rm -f ~/.zprofile
ln -s ${SCRIPT_FOLDER}/home/zprofile ~/.zprofile

rm -f ~/.zpreztorc
ln -s ${SCRIPT_FOLDER}/home/zpreztorc ~/.zpreztorc

rm -f ~/.zlogout
ln -s ${SCRIPT_FOLDER}/home/zlogout ~/.zlogout

rm -f ~/.zlogin
ln -s ${SCRIPT_FOLDER}/home/zlogin ~/.zlogin
