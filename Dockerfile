FROM debian:stretch-slim
MAINTAINER Emmanuele Bassi <ebassi@gmail.com>

RUN apt-get update -qq && apt-get install -qq -y \
        clang \
        gcc \
        gobject-introspection \
        gir1.2-glib-2.0 \
        libgirepository1.0-dev \
        libglib2.0-dev \
        locales \
        ninja-build \
        pkg-config \
        python3 \
        python3-pip

RUN locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8

ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8

RUN pip3 install meson

COPY graphene-run-tests.sh /root
RUN chmod +x /root/graphene-run-tests.sh
