FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  chromium \
  xvfb \
  x11vnc \
  websockify \
  openbox \
  dbus-x11 \
  fonts-dejavu \
  wget \
  --no-install-recommends && \
  apt clean && rm -rf /var/lib/apt/lists/*

# Install cert dependencies for noVNC
RUN apt update && apt install -y \
  ca-certificates \
  wget \
  unzip \
  --no-install-recommends

# Install noVNC and websockify
RUN mkdir -p /opt/novnc /opt/websockify && \
    wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.zip -O /tmp/novnc.zip && \
    wget https://github.com/novnc/websockify/archive/refs/tags/v0.10.0.zip -O /tmp/websockify.zip && \
    unzip /tmp/novnc.zip -d /opt && \
    unzip /tmp/websockify.zip -d /opt && \
    mv /opt/noVNC-1.4.0/* /opt/novnc && \
    mv /opt/websockify-0.10.0/* /opt/websockify && \
    rm -rf /tmp/*.zip

COPY start-stream.sh /start-stream.sh
RUN chmod +x /start-stream.sh

CMD ["/start-stream.sh"]