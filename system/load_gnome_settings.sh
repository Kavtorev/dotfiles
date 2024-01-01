dir="$(dirname "$0")"

dconf load /org/gnome/terminal/ < "$dir/gnome-terminal-settings.conf" && \
dconf load /org/gnome/desktop/input-sources/ < "$dir/language-keyboard-shortcuts.conf" && \
dconf load /org/gnome/shell/extensions/dash-to-dock/ < "$dir/dash-to-dock-settings.conf"
