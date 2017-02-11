#!/bin/bash

mkdir _build && cd _build

meson --prefix /usr "$@" .. || exit $?
ninja || exit $?
ninja test || exit $?

cd ..

rm -rf _build
