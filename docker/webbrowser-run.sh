#!/bin/bash

#chmod 777 /dev/vchiq

# start X11 on display 0
startx -- :0 &
sleep 2
export DISPLAY=:0

# disable display power management
xset -dpms

# disable screensaver
xset s off

# prevent screen from going blank
xset s noblank

# start webrowser
if [ "$1" = "vivaldi" ]; then
  vivaldi \
   --verbose \
   --no-sandbox \
   --user-data-dir='/storage/.config/vivaldi' \
   --start-maximized \
   --ignore-gpu-blocklist \
   --enable-accelerated-video-decode \
   --enable-gpu-rasterization \
   --enable-oop-rasterization \
   --disable-gpu-driver-bug-workarounds \
   --use-gl=desktop \
   $2
fi
#   --enable-features=VaapiVideoDecoder \

if [ "$1" = "chromium-browser" ]; then
  chromium-browser \
   --verbose \
   --no-sandbox \
   --user-data-dir='/storage/.config/chromium-browser' \
   --start-maximized \
   --ignore-gpu-blocklist \
   --enable-accelerated-video-decode \
   --use-gl=desktop \
   --enable-features=VaapiVideoDecoder \
   $2
fi
#   --enable-gpu-rasterization \
#   --enable-oop-rasterization \
#   --disable-gpu-driver-bug-workarounds \
