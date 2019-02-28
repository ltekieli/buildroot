#!/bin/sh

set -u
set -e

mkdir -p ${TARGET_DIR}/etc/wpa_supplicant
wpa_passphrase ${WPA_SUPP_SSID} ${WPA_SUPP_PASS} > ${TARGET_DIR}/etc/wpa_supplicant/wpa_supplicant-wlan0.conf
