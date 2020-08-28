if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi
if [[ $TERM == xterm-termite ]]; then
                . /etc/profile.d/vte.sh
                __vte_prompt_command
              fi
xhost +local:root > /dev/null 2>&1
#complete -cf sudo
umask 0002
set -o vi
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
BOWSER=/usr/bin/firefox
export HISTSIZE=10000
#export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export JAVA_FONTS=/usr/share/fonts/TTF
export TERMINAL=/usr/bin/terminator
export EDITOR=/usr/bin/vim
export PATH=/home/sot/.local/bin:":$PATH"
####################### ALIAS'S ####################################################################
alias aliases='cd ~ && cat .bashrc | grep alias'
alias as=".local/bin/allservers"
#alias bakup="sudo rsync -azvhP --exclude-from '.homeexclude.txt' /home/sot /run/media/sot/DATA/backup"
alias bakup="sudo rsync -avzS --delete /run/media/sot/DATA/ /run/media/sot/3cfaf2de-510b-4224-bcc5-0810bd4eca69/"
alias bm='bashmount'
alias blame='sudo systemd-analyze blame'
alias brokelnk='find . -type l -! -exec test -e {} \; -print'
alias changedtoday='find ~ -type f -mtime 0'
alias chromium='chromium -password-store=basic'
alias cp="cp -i"                          # confirm before overwriting something
alias cu="checkupdates"
alias dmes="sudo sysctl kernel.dmesg_restrict=0"
alias dskinfo='sudo lsblk -o name,label,size,fstype,model'
alias df='df -h'                          # human-readable sizes
alias errors="journalctl -b -p err|less"
alias fail='journalctl -p 3 -xb'
alias fixit='sudo rm -f /var/lib/pacman/db.lck && sudo pacman-mirrors -g && sudo pacman -Syyuu  &&'
alias free='free -m'                      # show sizes in MB
alias grep='grep --color=tty -d skip'
alias iv='vim'
alias l.='ls -d .* --color=auto'
#alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -aB --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias llt='ls -alt --group-directories-first --color=auto -F'
alias lls='ls -als --group-directories-first --color=auto -F'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias mp='mousepad'
alias np='nano PKGBUILD'
alias netinfo='hwinfo --netcard --wlan --bluetooth | grep -Ei "model\:|driver\:|status\:|cmd\:|file\:|detected\:" | grep -v "Config Status"'
#alias pacnew='locate -e --regex "\.pac(new|orig|save)$"'
#alias pacnew='grep --extended-regexp "pac(new|save)" /var/log/pacman.log'
alias pacnew='updatedb && locate --existing --regex "\.pac(new|save)$'
alias pcr='sudo protonvpn c -r'
alias pkglist='comm -23 <(pacman -Qeq|sort) <(pacman -Qmq|sort) > pkglist.txt'
alias scanhome='clamscan --recursive --infected /home'
alias scandisk="clamscan --recursive --infected --exclude-dir='^/sys|^/dev' /"
alias share='python -m http.server'
alias src='source ~/.bashrc'
alias update='sudo pacman -Syyu'
alias vw='vim vimwiki/index.wiki'
alias forecast='curl -s wttr.in/44870'
alias wthr='curl -s wttr.in/44870'
alias wx='inxi -wxxx'
######################### MEDIA ##############################################################
alias ma='mpv --ytdl-format bestaudio'
alias v='mpv'
alias yta='youtube-dl --extract-audio '
alias yt='youtube-dl'
######################### INVEST ############################################################
alias br='buyRange.py'
alias lc='/usr/bin/loss_calc.py'
alias pd='/usr/bin/priceDiff.py'
###############################################################################################
# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
screenfetch
# prompt -- change color when su
PS1='[\u@\h \W]\$ '
PS1='\e[1;31m''[\u@\h \W]\$''\e[0;m '
if [[ $EUID = 0 ]]; then
    PS1='\e[1;31m''[\u@\h \W]\$''\e[0;m '
else
    PS1='\e[0;32m''[\u@\h \W]\$ '
fi
#colored man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
if [[ $TERMINIX_ID ]]; then
        source /etc/profile.d/vte.sh
fi
source /usr/share/nvm/init-nvm.sh
