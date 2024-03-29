sudo apt install -y gnome-tweaks && \
sudo apt install -y sassc && \


downloads_dir="$HOME/Downloads"
clone_dir="$downloads_dir/dash-to-dock"

if [ -d "$clone_dir" ]; then
    echo "The 'dash-to-dock' folder already exists. Skipping cloning."
else
    git clone https://github.com/micheleg/dash-to-dock.git "$clone_dir" || exit
fi

make -C "$clone_dir" install && \
echo "Dash to Dock installation completed."


dir="$(dirname "$0")"

dconf load /org/gnome/terminal/ < "$dir/gnome-terminal-settings.conf" && \
dconf load /org/gnome/desktop/input-sources/ < "$dir/language-keyboard-shortcuts.conf" && \
dconf load /org/gnome/shell/extensions/dash-to-dock/ < "$dir/dash-to-dock-settings.conf"

# reload the GNOME Shell
# gnome-shell --replace &