#!/bin/bash
export DISPLAY=:1

# Start VNC server
vncserver :1 \
    -geometry 1366x768 \
    -depth 24 \
    -localhost no \
    -SecurityTypes VncAuth \
    -PasswordFile /home/vscode/.vnc/passwd

# Start noVNC
websockify --web=/usr/share/novnc 6080 localhost:5901 &

echo "Desktop ready on port 6080"
tail -f /dev/null
