FROM debian:stretch
MAINTAINER Emmanuele Bassi <ebassi@gmail.com>

RUN apt-get update -qq && apt-get install -qq -y \
        gcc \
        gobject-introspection \
        gir1.2-glib-2.0 \
        git-core \
        libc6-dev \
        libgirepository1.0-dev \
        libglib2.0-dev \
        locales \
        make \
        ninja-build \
        pkg-config \
        python \
        python3 \
        python3-pip

RUN locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN pip3 install meson

COPY graphene-run-tests.sh /root
RUN chmod +x /root/graphene-run-tests.sh
