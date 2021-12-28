SCRIPT_FOLDER="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

${SCRIPT_FOLDER}/install_yay.sh

yay -S --needed - < packages.txt

sudo chsh $USER -s /usr/bin/zsh

${SCRIPT_FOLDER}/link_config.sh
