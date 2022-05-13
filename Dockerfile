FROM debian:stable

COPY . /lftp
WORKDIR /lftp

RUN apt-get update; \
    apt-get -y install openssl build-essential libreadline-dev libssl-dev ncurses-dev libgnutls28-dev pkg-config zlib1g-dev autoconf libtool gettext automake gnulib; \
    ./autogen.sh; \
    ./configure --with-openssl; \
    make -j$(nproc); \
    make install

RUN mkdir -p /mnt
WORKDIR /mnt

ENTRYPOINT ["lftp"]
