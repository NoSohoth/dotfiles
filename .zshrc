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
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
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
eval $( dircolors -b /home/maelstrom/Git/zsh/LS_COLORS/LS_COLORS )
