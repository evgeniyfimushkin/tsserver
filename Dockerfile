FROM ubuntu:24.04

ENV TSSERVER_LICENSE_ACCEPTED=accept

RUN apt-get update && apt-get install -y wget curl bzip2 libatomic1 lib32stdc++6 telnet tar vim && rm -rf /var/lib/apt/lists/*

RUN curl -L -O "https://github.com/teamspeak/teamspeak6-server/releases/download/v6.0.0%2Fbeta7/teamspeak-server_linux_amd64-v6.0.0-beta7.tar.bz2"

RUN tar -xjf teamspeak-server_linux_amd64-v6.0.0-beta7.tar.bz2

WORKDIR /teamspeak-server_linux_amd64

CMD ["/teamspeak-server_linux_amd64/tsserver"]
