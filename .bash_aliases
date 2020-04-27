# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# stop using dir
alias dir='echo What is this, Windows?!'

# open uxterm in a new window
alias term='(uxterm &)'
alias terminal='term'

# open uxterm with title 'uxtermf', i3 will float this window
alias termf='(uxterm -class UXTerm -u8 -title "uxtermf" &)'

# funny polite sudo alias
alias please='sudo'

# quick file browser alias
alias files='nautilus'

# 1s sensors
alias qsensors='watch -n 1 sensors'

# gnome-mpv shorthand
alias gmpv='gnome-mpv'


# pulseaudio card profile shorthands
alias alsa-speakers='pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-stereo+input:analog-stereo'
alias alsa-hdmi='pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo+input:analog-stereo'

# shows human-readable disc usage for a single file or directory
alias dush='du -sh'


# get SSID
alias ssidget='nmcli -t -f NAME connection show --active'
