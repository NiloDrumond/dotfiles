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

create_symlink hypr ~/.config/hypr
create_symlink nvim ~/.config/newvim
create_symlink rofi ~/.config/rofi
create_symlink waybar ~/.config/waybar
create_symlink neofetch ~/.config/neofetch
create_symlink ssh/config ~/.ssh/config
create_symlink .zshrc ~/.zshrc
