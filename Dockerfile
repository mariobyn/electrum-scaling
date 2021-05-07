FROM python:3.7.5-slim-buster AS base
#Python 3.7.5 on Debian 10

ENV DEBIAN_FRONTEND noninteractive
ENV ELECTRUM_VERSION 4.1.2

COPY Electrum-${ELECTRUM_VERSION}.tar.gz ./

COPY start-daemon.sh .

RUN chmod 700 start-daemon.sh
 
RUN apt-get update \
    && mkdir -p /usr/share/man/man1 \
	&& apt-get install -y --no-install-recommends expect jq default-jre curl gnupg2 dirmngr \
	&& apt-get install -y python3-pyqt5 libsecp256k1-0 python3-cryptography

RUN pip install --upgrade pip

RUN pip install /Electrum-${ELECTRUM_VERSION}.tar.gz \
    && pip install pycryptodome \
    && pip install cryptography \
	&& test -f /usr/local/bin/electrum \
	&& rm -vrf Electrum-${ELECTRUM_VERSION}.tar.gz \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*    

ENV ELECTRUM_USER root
ENV ELECTRUM_HOME /$ELECTRUM_USER
ENV RPC_PORT 7777


CMD ./start-daemon.sh test 123456
