set -Ux EDITOR micro
set -Ux VISUAL micro
zoxide init fish | source
starship init fish | source

# general
alias m='micro'
alias y='yazi'
alias c='clear'
alias nm='nmtui'
alias cpwd='pwd | xclip -selection clipboard' #copy working directory to clipboard

# grit
alias grap='grit add -p'
alias grar='grit add -r'
alias grad='grit add'

# ls
alias lsa='ls -a'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'

# yay 
alias ys='yay -S --needed'
alias yss='yay -Ss'
alias ysi='yay -Si' #information on a package
alias ysyu='yay -Syu'
alias yq='yay -Q'

# eza
alias e="eza -xa --icons --group-directories-first $argv"
alias e1='eza -Ta -L1 --icons --group-directories-first $argv'
alias e2='eza -Ta -L2 --icons --group-directories-first $argv'
alias e3='eza -Ta -L3 --icons --group-directories-first $argv' 
alias eu='eza -Ta -L2 --icons --group-directories-first .. $argv'
    #to output as whole directory add '--absolute'

# git
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME $argv'
###
alias backup-dots='rsync -av --delete ~/.config/fish ~/.dotfiles/fish
rsync -av --delete ~/.config/bspwm ~/.dotfiles/bspwm
rsync -av --delete ~/.config/sxhkd ~/.dotfiles/sxhkd
rsync -av --delete ~/.config/yazi ~/.dotfiles/yazi'
###
alias sync-dots=' rsync -av --delete ~/.config/fish ~/.dotfiles/fish
    rsync -av --delete ~/.config/bspwm ~/.dotfiles/bspwm
    rsync -av --delete ~/.config/sxhkd ~/.dotfiles/sxhkd
    rsync -av --delete ~/.config/yazi ~/.dotfiles/yazi
    cd ~/.dotfiles
    git add .
    git commit -m "Sync updated configs"
    git push
    cd /home/lrosebrough
    echo "Git Repo Synced..."'

# function fish_greeting
#     echo (set_color blue)(date +%d-%m-%Y) : (set_color yellow)(date +%T)
# end

function fish_greeting
echo " _____ _     _ "    
echo "|  ___(_)___| |__"  
echo "| |_  | / __| '_ \ " 
echo "|  _| | \__ \ | | |"
echo "|_|   |_|___/_| |_|"                             

end

