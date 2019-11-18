FROM alpine:3.10
RUN apk add --no-cache unbound python3
RUN mkdir -p /etc/unbound/unbound.conf.d/adblock/
RUN mkdir -p /etc/adblock-update/
COPY unbound.conf /etc/unbound/unbound.conf
COPY blocklist.json /etc/adblock-update/blocklist.json
COPY adblock-update.py /etc/adblock-update/adblock-update.py
WORKDIR /etc/adblock-update/
#RUN python3 /etc/adblock-update/adblock-update.py
WORKDIR /
RUN unbound&
EXPOSE 53