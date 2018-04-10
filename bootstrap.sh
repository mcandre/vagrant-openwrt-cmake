#!/bin/sh

sudo opkg update &&
    sudo opkg install gcc wget libustream-openssl ca-certificates &&
    wget --directory-prefix /tmp https://cmake.org/files/v3.11/cmake-3.11.0.tar.gz &&
    sudo opkg remove --autoremove wget libustream-openssl ca-certificates

sudo opkg upgrade tar grep &&
    tar xzvf /tmp/cmake-3.11.0.tar.gz &&
    rm /tmp/cmake-3.11.0.tar.gz &&
    sh -c 'cd cmake-3.11.0 && ./configure --prefix=/usr && make && sudo make install' &&
    rm -rf cmake-3.11.0
