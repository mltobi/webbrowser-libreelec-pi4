#!/bin/sh

. /etc/os-release

systemctl stop kodi

case "$LIBREELEC_ARCH" in
  RPi*)
    dtparam audio=on
#    fbset -g 1920 1080 1920 1080 16
    ;;
  *)
esac

#cec-client | nc -u 127.0.0.1 1234 &

rm -fr /storage/.config/$1/SingletonLock
docker run --privileged --rm -it \
           -p 1234:1234/udp \
           -v /storage:/storage \
           -v /run/udev/data:/run/udev/data \
           -v /var/run/dbus:/run/dbus \
           webbrowser-libreelec-pi4 \
           /webbrowser-run.sh $1 $2

pkill -P $$

#case "$LIBREELEC_ARCH" in
#  RPi*)
#    fbset -g 1 1 1 1 32
#    ;;
#  *)
#esac

systemctl start kodi
