#!/bin/bash

# Start virtual X server
Xvfb :0 -screen 0 1920x1080x24 &
export DISPLAY=:0

# Start window manager
openbox &

# Launch Chromium
chromium \
  --no-sandbox \
  --disable-gpu \
  --window-size=1920,1080 \
  --start-maximized \
  --noerrdialogs \
  --disable-infobars \
  --disable-session-crashed-bubble \
  --disable-features=TranslateUI &

# Start x11vnc to stream the X session
x11vnc -display :0 -nopw -forever -shared -bg

# Start noVNC on port 8080
/opt/websockify/run --web /opt/novnc 8080 localhost:5900