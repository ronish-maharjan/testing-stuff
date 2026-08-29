#!/bin/bash
# Set up display
export DISPLAY=:1

# Start VNC server with optimized settings
vncserver :1 \
    -geometry 1366x768 \
    -depth 24 \
    -localhost no \
    -SecurityTypes VncAuth \
    -PasswordFile /home/vscode/.vnc/passwd

# Start noVNC web interface
cd /usr/share/novnc
websockify --web=/usr/share/novnc 6080 localhost:5901 &
echo "Desktop started on port 6080"

# Keep container running
tail -f /dev/null
