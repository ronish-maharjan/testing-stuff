# Use Ubuntu 22.04 as base
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Install system dependencies and XFCE desktop
RUN apt update && apt install -y \
    xfce4 xfce4-goodies \
    dbus-x11 x11-xserver-utils \
    tigervnc-standalone-server tigervnc-common \
    novnc websockify \
    firefox-esr \
    && apt clean

# Configure VNC startup
RUN mkdir -p /home/vscode/.vnc
COPY --chown=vscode:vscode .vnc/xstartup /home/vscode/.vnc/xstartup
RUN chmod +x /home/vscode/.vnc/xstartup

# Set VNC password (vscode)
RUN mkdir -p /home/vscode/.vnc && \
    echo "vscode" | vncpasswd -f > /home/vscode/.vnc/passwd && \
    chmod 600 /home/vscode/.vnc/passwd

# Set display environment
ENV DISPLAY=:1

# Create start script
COPY --chown=vscode:vscode scripts/start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
