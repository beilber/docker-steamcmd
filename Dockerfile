FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get install -y lib32gcc1 curl && \
  rm -rf /var/lib/apt/lists/*

RUN \
  mkdir /root/steamcmd

RUN \
  curl https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar xvz -C ~/steamcmd

RUN \
  cd ~/steamcmd && \
  ./steamcmd.sh +login anonymous +quit

ENTRYPOINT ["/root/steamcmd/steamcmd.sh"]

# Expose ports.
EXPOSE 27015
EXPOSE 27016
