#!/bin/sh

export XCURSOR_THEME=Animated-Mew-Cursor
export XCURSOR_SIZE=24
export XDG_CURRENT_DESKTOP=wlroots
export XDG_SESSION_TYPE=wayland


dbus-update-activation-environment --systemd \
    WAYLAND_DISPLAY \
    XDG_CURRENT_DESKTOP \
    XDG_SESSION_TYPE

sleep 0.5

# Matar instâncias antigas dos portais se existirem
pkill -x xdg-desktop-portal-wlr 2>/dev/null
pkill -x xdg-desktop-portal 2>/dev/null
sleep 0.3

# Subir portais na ordem certa
/usr/lib/xdg-desktop-portal-wlr &
sleep 0.8
/usr/lib/xdg-desktop-portal --replace &
sleep 0.8

# Resto normal
waybar -c ~/.config/mango/config.jsonc -s ~/.config/mango/style.css >/dev/null 2>&1 &
swaybg -o DP-1 -i /home/julia/Downloads/bird1.jpg >/dev/null 2>&1 &
swaybg -o HDMI-A-1 -i /home/julia/Downloads/bird3.png >/dev/null 2>&1 &
kanshi &
vesktop >/dev/null 2>&1 &        # use só um dos dois
# discord --enable-features=WebRTCPipeWireCapturer >/dev/null 2>&1 &
flatpak run com.spotify.Client &
helium-browser &
wl-clip-persist --clipboard regular --reconnect-tries 0 &
wl-paste --type text --watch cliphist store &

echo "Xft.dpi: 140" | xrdb -merge