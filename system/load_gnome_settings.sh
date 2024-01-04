sudo apt install -y gnome-tweak-tool && \
sudo apt install -y sassc && \


downloads_dir=~/Downloads
clone_dir="$downloads_dir/dash-to-dock"

if [ -d "$clone_dir" ]; then
    echo "The 'dash-to-dock' folder already exists. Skipping cloning."
else
    cd "$downloads_dir" &&    
    git clone https://github.com/micheleg/dash-to-dock.git "$clone_dir" || exit
fi

cd "$clone_dir" || exit
make install &&
echo "Dash to Dock installation completed."


dir="$(dirname "$0")"

dconf load /org/gnome/terminal/ < "$dir/gnome-terminal-settings.conf" && \
dconf load /org/gnome/desktop/input-sources/ < "$dir/language-keyboard-shortcuts.conf" && \
dconf load /org/gnome/shell/extensions/dash-to-dock/ < "$dir/dash-to-dock-settings.conf"

# reload the GNOME Shell
# gnome-shell --replace &