# dotfiles
What I use:
* Linux distribution : [Arch Linux](https://www.archlinux.org/ "Arch Linux")
* Tiling window manager : [i3-wm](https://i3wm.org/ "i3-wm")
* Shell : [zsh](https://en.wikipedia.org/wiki/Z_shell "ZSH wiki")
* Music server/client : [mpd](http://www.musicpd.org/ "mpd") + [ncmpcpp](http://rybczak.net/ncmpcpp/ "ncmpcpp")
* Media player : [mplayer](https://mplayerhq.hu/ "MPlayer")
* Display dimmer : [redshift](https://en.wikipedia.org/wiki/Redshift_(software) "redshift")

## Screenshot
![Almost there :) Unless the image cannot be retrieved properly :/](https://i.imgur.com/NVPL2Vq.png)

## Special "Xorg/bumblebee with external HDMI output on Nvidia Optimus laptop" cheat sheet section because I'm tired of loosing a few hours on finding the specific Xorg option that prevents everything from working everytime I'm rebuilding my setup (ask Linus for a summary)

* Follow the ArchWiki. When in doubt, read again. And again. You can also read the hundreds of threads of people that had the same hardships.
* For 390xx, make sure linux-headers, mesa, bumblebee, (bbswitch), dkms, nvidia-390xx-dkms, nvidia-390xx-utils, nvidia-390xx-opencl are installed.
* You can use Driver "modesetting" for the intel hardware rather than cranky old xf86-video-intel (Driver "intel"). Remove every xf86 packages that you don't need, add i915 in the MODULES string of mkinitcpio.conf and regenerate the initramfs with sudo mkinitcpio.conf -P linux.
* In bumblebee.conf : KeepUnusedXServer=true, Driver=nvidia, PMMethod=none
* In xorg.conf.nvidia : UNCOMMENT BusID "PCI:01:00:0", COMMENT #Option "UseDisplayDevice" "none" (lost a few hours on these), in ServerLayout, set Option "AutoAddDevices" to "true" to avoid plenty of errors with input devices, in Device, add Option "AllowEmptyInitialConfiguration" to start the server no matter what to avoid issues (we want a robust setup here, this might not be needed afterwards), you can comment NoLogo and UseEDID.
* NOTHING in /etc/X11/xorg.conf(.d)
* If you've been nice, your HDMI port should emit electrons in a nice organised way. Unless it doesn't, doesn't it ? Read the ArchWiki again, re-read your /var/log/Xorg.8.log, or consider going to sleep :)
