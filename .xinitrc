#URxvt

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#xrandr

#BUMBLEBEE  xrandr --setprovideroutputsource modesetting NVIDIA-0
#BUMBLEBEE  xrandr --auto

#Wallpaper
sh ~/.fehbg &

#Set fr keyboard
setxkbmap fr

#Numlock ON
numlockx

#Make eyes happy
redshift &

#Music
#jackd -R -P70 -dalsa -r48000 -p256 -n2 &
mpd &

#i3
exec i3

#HDMI: add the following and comment exec i3
#
#DISPLAY=:0.1
#exec optirun i3
