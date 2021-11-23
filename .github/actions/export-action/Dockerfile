FROM debian:11

ADD https://github.com/zoni/obsidian-export/releases/download/v21.9.1/obsidian-export_Linux-x86_64 /bin/obsidian-export

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /bin/obsidian-export

WORKDIR "/repo"
ENTRYPOINT ["/entrypoint.sh"]