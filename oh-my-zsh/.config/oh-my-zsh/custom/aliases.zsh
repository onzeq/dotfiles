#script to remove whitespaces in file names
alias strip_spaces='python ~/scripts/strip_spaces.py' 

#python script invoke for TV Neuhausen lists
alias joomla='python3 $HOME/projects/joomla_anmeldung_clipboard/joomla_reservations.py'
#set built-in audio as default

alias ssd="pactl set-default-sink 'alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink'"
alias sbt="pactl set-default-sink 'bluez_sink.50_C2_ED_2F_23_EB.a2dp_sink'"
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

alias set_main="xrandr --output eDP-1 --primary"
alias set_desktop="xrandr --output DVI-I-2-2 --mode 1920x1080 --rate 60.00 --primary"
# aliases for quick jump to study related stuff
alias soft_eng="cd /home/jake/sem2/soft_eng"
alias sas="cd /home/jake/sem2/sas"
alias sig_proc="cd /home/jake/sem2/sig_proc"
alias test_rel="cd /home/jake/sem2/test_rel"
alias ese="cd /home/jake/OneDrive/Studium/02_Master_ESE"
alias micro="cd /home/jake/sem3/micro"
alias msi="cd /home/jake/sem3/msi"
alias defu="cd /home/jake/sem3/defu"


# wine executables
alias ltspice="wine \"C:\\LTspice\\LTspice.exe\""

# short clear command
alias c="clear"
# blueman manager shortcut
alias bm="blueman-manager &"

# exercism
alias go_ex="cd $HOME/projects/exercism"
alias arduino_ide="$HOME/arduino_ide/arduino-ide"
alias ods="onedrive --synchronize"

# i3 lock color black as standard
alias ilock="i3lock --color 000000"
alias matr="echo 5513235"

alias ffpol="sudo nvim /usr/lib/firefox/distribution/policies.json"
alias tms="tmux new -s main"
alias tma="tmux a -t main"
alias i3conf="vim ~/.config/i3/config"
alias exp="explorer ."
alias update-discord="~/scripts/discord/discord.sh"
alias xpwd="pwd && pwd | xclip -selection clipboard"
alias ls="ls -l"
alias theia="/home/jake/ti/ccstheia151/ccs/theia/ccstudio &"

alias ccs12="/home/jake/ti/ccs1281/ccs/eclipse/ccstudio &"
