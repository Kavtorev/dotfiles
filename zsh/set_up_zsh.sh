sudo apt install zsh -y && \
echo "zsh version: $(zsh --version)" && \

chsh -s $(which zsh) && \
sudo echo "Current shell: $SHELL" && \

ln -s -f ~/dotfiles/zsh/.zshrc ~/.zshrc
