FROM navikey/raspbian-bullseye

COPY 10-inputs.conf /etc/X11/xorg.conf.d/

COPY webbrowser-run.sh /

RUN chmod u+x webrowser-run.sh \
 && apt-get update \
 && apt-get install -y --reinstall keyboard-configuration \
 && apt-get install -y \
            chromium-browser \
            dbus-x11 \
            lsb-release \
            matchbox-window-manager \
            netcat \
            xdotool \
            xorg \
            xserver-xorg-input-evdev \
            libgles2-mesa \
 && apt-get -y install fonts-liberation \
 && wget https://downloads.vivaldi.com/stable/vivaldi-stable_5.0.2497.32-1_armhf.deb \
 && dpkg -i vivaldi-stable_5.0.2497.32-1_armhf.deb
