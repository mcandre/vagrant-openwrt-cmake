#!/bin/sh

sudo opkg update &&
    sudo opkg install gcc patch wget libustream-openssl ca-certificates &&
    wget --directory-prefix /tmp https://cmake.org/files/v3.11/cmake-3.11.0.tar.gz &&
    sudo opkg remove --autoremove wget libustream-openssl ca-certificates

sudo opkg upgrade tar grep &&
    tar xzvf /tmp/cmake-3.11.0.tar.gz &&
    rm /tmp/cmake-3.11.0.tar.gz &&
    sh -c 'cd cmake-3.11.0 && \
        patch -p0 </tmp/bootstrap.patch && \
        patch -p0 </tmp/SystemInformation.cxx.patch && \
        patch -p0 </tmp/json_reader.cpp.patch && \
        patch -p0 </tmp/json_writer.cpp.patch && \
        patch -p0 </tmp/cmQtAutoGenerator.cxx.patch && \
        patch -p0 </tmp/cmQtAutoGenInitializer.cxx.patch && \
        patch -p0 </tmp/cmCTest.cxx.patch && \
        patch -p0 </tmp/cmCTestScriptHandler.cxx.patch && \
        patch -p0 </tmp/cmProcess.cxx.patch && \
        patch -p0 </tmp/GNU-C.cmake.patch && \
        patch -p0 </tmp/GNU-CXX.cmake.patch && \
        patch -p0 </tmp/cmlibuv-CMakeLists.txt.patch && \
        ./configure --prefix=/usr && \
        make && \
        sudo make install' &&
    rm -rf cmake-3.11.0 &&
    sudo opkg remove --autoremove patch
