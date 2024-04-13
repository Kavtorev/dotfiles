sudo apt install zsh -y && \
echo "zsh version: $(zsh --version)" && \

chsh -s $(which zsh) && \
sudo echo "Current shell: $SHELL" && \

sudo apt update && \
sudo apt install autojump -y && \
ln -s -f ~/dotfiles/linux/zsh/.zshrc ~/.zshrc
