#URxvt

[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

#xrandr

#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto

#Wallpaper
sh ~/.fehbg &

#Set fr keyboard
setxkbmap fr

#Numlock ON
numlockx

redshift &
#Yay my eyes are happy now :)

#Music
#jackd -R -P70 -dalsa -r48000 -p256 -n2 &
#mpd &

#i3
exec i3

#HDMI: add the following and comment exec i3
#
#DISPLAY=:0.0
#exec optirun i3
