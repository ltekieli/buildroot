#!/bin/bash

function _build() {
    CONFIG=$1

    make "custom_${CONFIG}_defconfig" O="output_${CONFIG}"
    make O="output_${CONFIG}"

    tar -c \
        --sort=name \
        --mtime="2021-12-01" \
        --owner=0 \
        --group=0 \
        --numeric-owner \
        -C "output_${CONFIG}"/staging . \
        | gzip -n > "output_${CONFIG}"/${CONFIG}.tar.gz

    sha256sum "output_${CONFIG}"/${CONFIG}.tar.gz > "output_${CONFIG}"/${CONFIG}.tar.gz.sha256
}

function release() {
    VERSION=$1
    hub release create -m "${VERSION}" \
           -a output_beaglebone/beaglebone.tar.gz \
           -a output_beaglebone/beaglebone.tar.gz.sha256 \
           -a output_raspberrypi0w/raspberrypi0w.tar.gz \
           -a output_raspberrypi0w/raspberrypi0w.tar.gz.sha256 \
           -a output_raspberrypi3_64/raspberrypi3_64.tar.gz \
           -a output_raspberrypi3_64/raspberrypi3_64.tar.gz.sha256 \
           "${VERSION}"
}

function build_all() {
    _build beaglebone
    _build raspberrypi0w
    _build raspberrypi3_64
}

case ${1:-build_all} in
    release)
        release $2
        ;;
    *)
        build_all
        ;;
esac
