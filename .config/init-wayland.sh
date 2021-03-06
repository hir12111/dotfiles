#!/usr/bin/env bash
. ~/.config/init-common.sh
# Run clipboard manager with no-persist to not loose rich content in copy
wl-paste -p -t text --watch clipman store --no-persist &
# socket activation would not allow to connect immediately
systemctl start --user pulseaudio
systemctl start --user gammastep
# my beautiful headphones
echo connect EB:06:EF:1D:A2:F5 | bluetoothctl
# player server
one-instance mpd
# notification daemon
mako &
mkfifo $XDG_RUNTIME_DIR/wobpipe
{ tail -f $XDG_RUNTIME_DIR/wobpipe | wob ; } &
