#-----------------------------------------------------------#
# File: .zshrc ZSH resource file							#
#-----------------------------------------------------------#

#------------------------------
# Oh-My-Zsh
#------------------------------
#Must be at the beginning of the file, otherwise the keybindings won't work
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sporty_256"
plugins=(adb git)
source $ZSH/oh-my-zsh.sh

#------------------------------
# History
#------------------------------
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#setopt HIST_IGNORE_DUPS #Prevent from putting duplicate lines in the history

#------------------------------
# Variables
#------------------------------
export PATH=~/bin:$PATH
export TERM=rxvt-unicode-256color
export BROWSER="firefox"
export EDITOR="vim"
export SUDO_EDITOR=rvim
export SDCV_PAGER=/usr/bin/less

#------------------------------
# Keybindings
#------------------------------
bindkey -e

if [ $(tty | cut -c1-8) = "/dev/pts" ]
then
	bindkey  "^[[H"   beginning-of-line
	bindkey  "^[[F"   end-of-line
	bindkey  "^[[3~"  delete-char
	bindkey  "^[[A"   up-line-or-history
	bindkey  "^[[B"   down-line-or-history
	bindkey  "^[[D"   backward-char
	bindkey  "^[[C"   forward-char
	bindkey  "^[[5~"  history-beginning-search-backward
	bindkey  "^[[6~"  history-beginning-search-forward
elif [ $(tty | cut -c1-8) = "/dev/tty" ]
then
	bindkey  "^[[1~"  beginning-of-line
	bindkey  "^[[4~"   end-of-line
	bindkey  "^[[3~"  delete-char
	bindkey  "^[[A"   up-line-or-history
	bindkey  "^[[B"   down-line-or-history
	bindkey  "^[[D"   backward-char
	bindkey  "^[[C"   forward-char
	bindkey  "^[[5~"  history-beginning-search-backward
	bindkey  "^[[6~"  history-beginning-search-forward
fi

# Ctrl-Z to pause and unpause a command
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#------------------------------
# Aliases
#------------------------------
alias ls='ls --color -F'
alias ll='ls --color -alhF'
alias grep='grep --color=always'
alias temp='watch -n 1 nvidia-smi'
alias rezid='ssh stranger@rezid.org -L 4004:10.5.30.2:22'
alias mplayerHDMI='DISPLAY=:0.1 optirun mplayer -fs'
alias getWWW='wget -r -k -E -np'
alias tf2='SteamAppId=440 vblank_mode=0 optirun .local/share/Steam/SteamApps/common/Team\ Fortress\ 2/hl2.sh -steam -console -game tf -novid'
#####AUDIO
alias music='sshfs pierre@10.5.34.1:/home/music /mnt/music'
alias splitFLAC='cuebreakpoints *.cue | shnsplit -o flac -t "%t" *.flac'
alias jack2='jackd -R -P70 -dalsa -r48000 -p256 -n2 &'
alias ncmpcppJACK='jack2; killall mpd; mpd ~/.config/mpd/mpdJACK.conf &; sleep 1; clear; ncmpcpp; killall jackd; killall mpd; alsactl init; mpd &'
#####ENIB
alias enib='sftp -oPort=55555 p2puech@sftp.enib.fr'
alias wenib='sftp -oPort=55555 p2puech@sftp-w.enib.fr'
alias punset='unset http_proxy https_proxy ftp_proxy no_proxy'
#####CRYPTOMINING
alias mineCOYE='optirun cudaminer -o stratum+tcp://givemecoye.com:3307 -u Maelstr0m.1 -p 1 -l F8x4 -i 0 -C 2 -H 1'
alias mineDOGE='optirun cudaminer -o stratum+tcp://stratum.doge.hashfaster.com:3339 -u Maelstr0m.1 -p 1 -l F8x4 -i 0 -C 2 -H 1'
alias mineDRK='/home/maelstrom/Cryptocurrencies/cpuminer/cpuminer-multi/minerd -a x11 -o stratum+tcp://stratum.simpledrk.com:3353 -u XsxTonGPPjagaUmBLxaovjjPhiMyG2taaJ.1 -p 1'
#####VPN
alias openvpnSK='sudo openvpn /etc/openvpn/securityKiss.conf'
alias openvpnVB='sudo openvpn /etc/openvpn/VPNBook.conf'
alias openvpnVG='sudo openvpn /etc/openvpn/VPNGate.ovpn'
#####WINE
alias ltspice='WINEPREFIX=~/.wine wine ~/.wine/drive_c/Program\ Files\ \(x86\)/LTC/LTspiceIV/scad3.exe'
alias bl2='optirun wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Borderlands\ 2/Binaries/Win32/Borderlands2.exe'
alias catia20='WINEPREFIX=~/.wine-catia wine ~/.wine-catia/drive_c/Program\ Files/Dassault\ Systemes/B20/win_b64/code/bin/CNEXT.exe'
alias catia19='WINEPREFIX=~/.wine-catiaV5R19 WINEARCH=win32 wine ~/.wine-catiaV5R19/drive_c/Program\ Files/Dassault\ Systemes/B19/intel_a/code/bin/CNEXT.exe'
alias hw2='cd ~/.wine-hw2/dosdevices/c:/Program\ Files/Sierra/Homeworld2/Bin/Release && WINEPREFIX=~/.wine-hw2 optirun wine ~/.wine-hw2/drive_c/Program\ Files/Sierra/Homeworld2/Bin/Release/Homeworld2.exe -w 1920 -h 1080 -fullscreen -novideoerrors -d36'
alias photoshop='WINEARCH=win32 WINEPREFIX=~/.wine-ps wine ~/.wine-ps/drive_c/Program\ Files/Adobe/Adobe\ Photoshop\ CS6/Photoshop.exe'
alias fallout3='WINEPREFIX=~/.wine-fallout3 wine ~/.wine-fallout3/drive_c/Program\ Files\ \(x86\)/Bethesda\ Softworks/Fallout\ 3/FalloutLauncher.exe'
#####
source ~/.zsh_aliases

#------------------------------
# Coloured manuals
#------------------------------
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

#------------------------------
# Completion
#------------------------------
autoload -Uz compinit
compinit
zstyle :compinstall filename '/home/maelstrom/.zshrc'

#------------------------------
# Prompt
#------------------------------
#autoload -U promptinit #Set clint as prompt
#promptinit
#prompt clint

#------------------------------
# LS_COLORS
#------------------------------
eval $( dircolors -b /home/maelstrom/Git/LS_COLORS/LS_COLORS )
