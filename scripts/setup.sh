#!/usr/bin/env bash
# bash script by matteospanio <matteo.spanio97@gmail.com>
# link your dotfiles

HOME_CONF=( '.zshrc' '.bashrc' '.tmux.conf'  '.mpd' )

pwd | grep 'dotfiles$'
if [ $? -ne 0 ]; then
    echo "you should execute this script from the dotfiles forlder"
    exit 1
fi

function save_backup() {
    if [ -f "$HOME/$1" ]; then
        echo "found existing $1 and saved as $1.bak"
        mv "$HOME/$1" "$HOME/$1.bak"
    fi 
}

for file in "${HOME_CONF[@]}"; do 
    save_backup "$file"
    echo "linking $file in $HOME"
    ln -s "$(pwd)/$file" "$HOME/$file"
done

CON='.config'
for file in $(ls $CON); do
    echo "linking $file in $HOME/$CON"
    ln -s "$(pwd)/$CON/$file" "$HOME/$CON/$file"
done

