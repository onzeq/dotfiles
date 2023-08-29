# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#default ps1
#if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi

#custom ps1
#if [ "$color_prompt" = yes ]; then
#    PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='$\u@\h:\w\$ '
#fi

LOCATION=' \[`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
#export PS1="\u@\h\[\e[32m\]$LOCATION\[\e[91m\] \$(parse_git_branch)\[\e[00m\]$ "


unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -lh --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#####ROS##### 
source /opt/ros/noetic/setup.bash
source $HOME/catkin_ws/devel/setup.bash
#Exports
#exports to use raspberry as rosmaster
export ROS_IP=192.168.0.82
export ROS_MASTER_URI=http://192.168.0.126:11311

#export path of matlab
export PATH="/usr/local/MATLAB/R2021b/bin:$PATH"
#map capslock to alt_gr
xmodmap ~/.Xmodmap

#go up directories easily
up () {
    local d=""
    local limit="$1"

    #Default to limit of 1
    if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
        limit=1
    fi

    for ((i=1;i<=limit;i++)); do    
        d="../$d"
    done

    # perform cd. Show errir if cd fails
    if ! cd "$d"; then
        echo "Couldn't go up $limit dirs.";
    fi
}

##### ALIASES #####
#use python for pyhton3
#alias python='python3'

#script to remove whitespaces in file names
alias strip_spaces='python ~/scripts/strip_spaces.py' 

#python script invoke for TV Neuhausen lists
alias joomla='python3 $HOME/projects/joomla_anmeldung_clipboard/joomla_reservations.py'
#set built-in audio as default

alias ssd="pactl set-default-sink 'alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink'"
alias input_set_default="pactl set-default-source alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_6__source"
alias audio_set_default="pactl set-default-source alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_6__source && pactl set-default-sink alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink"

#update and upgrade 
alias aptup="sudo apt update && sudo apt upgrade -y && sudo apt-get update -y && sudo apt-get upgrade -y"

#map altgr to capslock
alias map="xmodmap ~/.Xmodmap"

#use htop with process trees
alias htop='htop --tree'

# suspend
alias st="sudo systemctl suspend"

#shutdown
alias sd="sudo systemctl poweroff"

#change fn mode for keyboard 
alias fn="echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode"

. "$HOME/.cargo/env"

#open exporer
alias explorer="nautilus --browser . &"

#open zotero 
alias zotero="$PATH/programs/Zotero/zotero"

#connect to headphones
alias bt1="bluetoothctl connect 50:C2:ED:2F:23:EB"
alias bt2="bluetoothctl power on && bluetoothctl connect 04:CB:88:1A:58:54"

# turn built in monitor on, off
alias main_on="xrandr --output eDP-1 --auto --left-of DVI-I-2-2"
alias main_off="xrandr --output eDP-1 --off"

# brightness shortcut aliases
alias light_30="sudo brightnessctl set 30%"
alias light_100="sudo brightnessctl set 100%"
alias light_50="sudo brightnessctl set 50%"

# map input to main screen
alias map_input="python3 $HOME/scripts/map_input.py"

# starting nvim
alias vim="nvim"

# two chars for firefox
alias ff="env MOZ_USE_XINPUT2=1 firefox"

# variable for exercism workspace
export WSEXERCISM='$HOME/snap/exercism/current/exercism/rust'

# variable for workspace studies
export STUDY='~/OneDrive/Studium/02_Master_ESE/1_Semester'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# function to create and than change directory
mkcd() {
	mkdir -p "$1"
	cd "$1"
}

# function to go up n directories
function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'

alias set_main="xrandr --output eDP-1 --primary"
# aliases for quick jump to study related stuff
alias soft_eng="cd /home/jake/sem2/soft_eng"
alias sas="cd /home/jake/sem2/sas"
alias sig_proc="cd /home/jake/sem2/sig_proc"
alias test_rel="cd /home/jake/sem2/test_rel"
alias ese="cd /home/jake/OneDrive/Studium/02_Master_ESE"

# wine executables
alias ltspice="wine \"C:\\LTspice\\LTspice.exe\""
neofetch
