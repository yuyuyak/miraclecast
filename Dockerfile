FROM debian:buster-slim

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y \
      build-essential \
      systemd \
      libgstreamer1.0-dev \
      libglib2.0-dev \
      libdbus-1-dev \
      libreadline-dev \
      libudev-dev \
      libsystemd-dev \
      libusb-dev \
      automake \
      autoconf \
      libtool \
      cmake \
      meson \
      valac \
      libgtk-3-dev

COPY . ./

RUN rm -rf build-cmake; \
    mkdir build-cmake; \
    cd build-cmake; \
    cmake ..; \
    make

