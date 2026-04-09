set -Ux EDITOR micro
set -Ux VISUAL micro
zoxide init fish | source
thefuck --alias | source

###
# general
alias m='micro'
alias y='yazi'
alias c='clear'
alias nm='nmtui'
alias cpwd='pwd | xclip -selection clipboard' #CoPyWorkingDirectory to clipboard
alias chs='bat /home/lrosebrough/.config/fish/config.fish' # fish alias CHeatSheet
alias ds='df -h /' # checks DiskSpace
alias hk='housekeeping.sh'
alias iv='fzf --multi --print0 | xargs -0 sxiv -t' #ImageView
alias sescrot='grim -g "$(slurp)" - | swappy -f -' #SElectiveSCReenShOT

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
alias ysi='yay -Si' # Information on a package
alias ysyu='yay -Syu'
alias yq='yay -Q'

# zoxide fzf
alias zf='cd $(zoxide query -l | fzf)'

# eza
alias e="eza -xa --icons --group-directories-first $argv"
alias e1='eza -Ta -L1 --icons --group-directories-first $argv'
alias e2='eza -Ta -L2 --icons --group-directories-first $argv'
alias e3='eza -Ta -L3 --icons --group-directories-first $argv' 
alias eu='eza -Ta -L2 --icons --group-directories-first .. $argv'

alias er1='eza -a --level=1 -R --absolute -1 --group-directories-first'
alias er2='eza -a --level=2 -R --absolute -1 --group-directories-first'
alias er3='eza -a --level=3 -R --absolute -1 --group-directories-first'
function es
    # eza + fzf + open in micro with colored output
    set file (eza -1 -a --icons | while read -l f
        if test -d "$f"
            # Blue for directories
            printf "\033[34m%s\033[0m\n" "$f"
        else
            # Orange for files (bright yellow/orange)
            printf "\033[38;5;214m%s\033[0m\n" "$f"
        end
    end | fzf --ansi --preview 'test -d {} && eza -a {} || bat {}')
    
    if test -n "$file"
        if test -d "$file"
            cd "$file"
        else
            $EDITOR "$file"
        end
    end
end

function ses # super es - shows ALL files and directories in CWD and either cd or opens text editor
set file (fd . | while read -l f
    if test -d "$f"
        # Blue for directories
        printf "\033[34m%s\033[0m\n" "$f"
    else
        # Orange for files (bright yellow/orange)
        printf "\033[38;5;214m%s\033[0m\n" "$f"
    end
end | fzf --ansi --preview 'test -d {} && eza -a {} || bat {}')
    if test -n "$file"
        if test -d "$file"
            cd "$file"
        else
            $EDITOR "$file"
        end
    end
end

# git
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME $argv'
###
alias backup-dots='rsync -av --delete ~/.config/fish ~/.dotfiles/fish
rsync -av --delete ~/.config/bspwm ~/.dotfiles/bspwm
rsync -av --delete ~/.config/sxhkd ~/.dotfiles/sxhkd
rsync -av --delete ~/.config/yazi ~/.dotfiles/yazi
rsync -av --delete ~/.config/mango ~/.dotfiles/mango
rsync -av --delete ~/.local/bin ~/.dotfiles/bin'
###
alias sync-dots=' rsync -av --delete ~/.config/fish ~/.dotfiles/fish
    rsync -av --delete ~/.config/bspwm ~/.dotfiles/bspwm
    rsync -av --delete ~/.config/sxhkd ~/.dotfiles/sxhkd
    rsync -av --delete ~/.config/yazi ~/.dotfiles/yazi
    rsync -av --delete ~/.config/mango ~/.dotfiles/mango
    rsync -av --delete ~/.local/bin ~/.dotfiles/bin
    cd ~/.dotfiles
    git add .
    git commit -m "Sync updated configs"
    git push
    cd /home/lrosebrough
    echo "Git Repo Synced..."'

# Long shit
function ers1
set file (
    eza -a --level=1 -R --absolute -1 --group-directories-first | while read -l f
        if test -d "$f"
            # Blue for directories
            printf "\033[34m%s\033[0m\n" "$f"
        else
            # Orange for files
            printf "\033[38;5;214m%s\033[0m\n" "$f"
        end
    end | fzf --ansi --preview 'test -d {} && eza -a {} || bat {}'
)

if test -n "$file"
    if test -d "$file"
        cd "$file"
    else
        $EDITOR "$file"
    end
end
end
###
function ers2
set file (
    eza -a --level=2 -R --absolute -1 --group-directories-first | while read -l f
        if test -d "$f"
            # Blue for directories
            printf "\033[34m%s\033[0m\n" "$f"
        else
            # Orange for files
            printf "\033[38;5;214m%s\033[0m\n" "$f"
        end
    end | fzf --ansi --preview 'test -d {} && eza -a {} || bat {}'
)

if test -n "$file"
    if test -d "$file"
        cd "$file"
    else
        $EDITOR "$file"
    end
end
end
###
function ers3
set file (
    eza -a --level=3 -R --absolute -1 --group-directories-first | while read -l f
        if test -d "$f"
            # Blue for directories
            printf "\033[34m%s\033[0m\n" "$f"
        else
            # Orange for files
            printf "\033[38;5;214m%s\033[0m\n" "$f"
        end
    end | fzf --ansi --preview 'test -d {} && eza -a {} || bat {}'
)

if test -n "$file"
    if test -d "$file"
        cd "$file"
    else
        $EDITOR "$file"
    end
end
end

function fish_greeting
end
