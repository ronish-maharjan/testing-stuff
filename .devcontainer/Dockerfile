FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV DISPLAY=:1

# Install system dependencies
RUN apt update && apt install -y \
    xfce4 xfce4-goodies \
    dbus-x11 x11-xserver-utils \
    tigervnc-standalone-server tigervnc-common \
    novnc websockify \
    firefox-esr \
    && apt clean

# Configure VNC startup
RUN mkdir -p /home/vscode/.vnc
COPY .vnc/xstartup /home/vscode/.vnc/xstartup
RUN chmod +x /home/vscode/.vnc/xstartup

# Expose ports
EXPOSE 5901 6080

# Set default user
USER vscode
WORKDIR /home/vscode

# Start script
COPY --chown=vscode:vscode scripts/start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
