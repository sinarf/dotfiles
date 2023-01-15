#!/usr/bin/env bash
# this script is meant to initialize a new computer using arch based distribution to:
# * automatically install this dotfile repo with the needed dependencies
#
# author: sinarf
set -eu

export DOT_FILES="${HOME}/.dotfiles"
ssh_public_key_file="${HOME}/.ssh/id_ed25519.pub"

if command -v paru; then
  echo "paru is already ready, skipping installation..."
else
  echo "Installation of paru..."
  sudo pacman -S --needed --noconfirm base-devel rust
  sudo pacman -S --needed --noconfirm cargo
  tmp_paru_src_dir=$(mktemp -d)
  git clone https://aur.archlinux.org/paru.git "${tmp_paru_src_dir}"
  pushd "${tmp_paru_src_dir}" >/dev/null || exit 1
  makepkg -si
  popd >/dev/null || exit 1
  rm -rf "${tmp_paru_src_dir}"
fi

echo "Install what needed for dotfile setup..."
paru -Syu --needed --noconfirm git stow zsh firefox tree kitty neovim-symlinks
if [ -f "${ssh_public_key_file}" ]; then
  echo "ssh public key already created."
else
  echo "Generating a new ssh key"
  ssh-keygen -t ed25519
fi

echo "Register the public ssh key in github account"
firefox https://github.com/settings/keys
cat "${ssh_public_key_file}"
read -p "Confirm that this key is registered on github before continuing...[<Space>]" -n 1 -r
if [[ ! ${REPLY} =~ ^ $ ]]; then
  echo "It is your choice, but I quit!"
  exit 1
fi

echo
echo "Setting up dotfiles in ${DOT_FILES}"
git clone git@github.com:sinarf/dotfiles.git "${DOT_FILES}"

export PATH=${DOT_FILES}/bin:${PATH}
backup_dir=${HOME}/tmp/init_backup
mkdir -pv "${backup_dir}"
echo "Moving files that might have been created in the installation process"

# TODO find a more robust way to do this
files_to_backup=("${HOME}/.bashrc" "${HOME}/.bash_profile" "${HOME}/.config/i3")
for file in "${files_to_backup[@]}"; do
  echo "Backup ${file}"
  backup_file="${backup_dir}${file}"
  mkdir -pv "$(dirname "${backup_file}")"
  if [ -f "${file}" ]; then
    mv -v "${file}" "${backup_file}"
  fi
done
echo "Files that have been backuped, just in case, it should be ok to remove it"
tree "${backup_dir}"

# create the applications directory so stow will link the the files not the directory
mkdir -pv "${HOME}"/.local/share/applications/
update_dotfiles.sh
sudo usermod --shell /bin/zsh "${USER}"
sudo groupadd -r autologin
sudo gpasswd -a "${USER}" autologin
sudo groupadd -r games

sudo vi /etc/pacman.conf /etc/lightdm/lightdm.conf
sudo cp -v "${DOT_FILES}/init/00-keyboard.conf" /etc/X11/xorg.conf.d/

"${DOT_FILES}/init/install_custom_neovim_config.sh"
"${DOT_FILES}/init/install_bluetooth.sh"

echo "Might be a good time to reboot..."
