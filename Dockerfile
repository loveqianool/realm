FROM alpine:latest

RUN wget $(wget -O- https://api.github.com/repos/zhboner/realm/releases | grep browser_download_url | cut -d '"' -f 4 | grep -m 1 realm-$(arch)-unknown-linux-musl.tar.gz) -O /tmp/realm.tar.gz && \
tar -xzf /tmp/realm.tar.gz && \
mv realm /usr/local/bin/realm && \
chmod +x /usr/local/bin/realm

ENTRYPOINT ["/usr/local/bin/realm"]
