function create_symlink {
    local src=$1
    local dest=$2
    if [[ ! $src =~ ^~ ]]; then
        src="$HOME/dotfiles/$src"
    fi

    if [[ -L $dest ]]; then
        echo -e "\033[33m$dest is already a symbolic link. Skipping...\033[0m"
    elif [[ -e $dest ]]; then
echo -e "\033[31mWarning: $dest already exists but is not a symbolic link. Skipping...\033[0m"
    else
        ln -s $src $dest
        echo -e "\033[32mCreated symlink $dest -> $src\033[0m"
    fi
}

# Directories
create_symlink hypr ~/.config/hypr
create_symlink nvim ~/.config/nvim
create_symlink rofi ~/.config/rofi
create_symlink waybar ~/.config/waybar
create_symlink neofetch ~/.config/neofetch
create_symlink mako ~/.config/mako
create_symlink lf ~/.config/lf
create_symlink kitty ~/.config/kitty
create_symlink wlogout ~/.config/wlogout
create_symlink wall-scheduler ~/.config/wall-scheduler

# Files
create_symlink ssh/config ~/.ssh/config
create_symlink .zshrc ~/.zshrc
create_symlink starship/starship.toml ~/.config/starship.toml
create_symlink nvm/default-packages ~/.nvm/default-packages
