#!/bin/sh

set -e

if [ -z "${WPA_SUPP_SSID}" ] || [ -z "${WPA_SUPP_PASS}" ]; then
    echo "WARNING: wpa_supplicant will not be configured"
    echo "WARNING: set WPA_SUPP_SSID and WPA_SUPP_PASS"
    exit 0
fi

mkdir -p ${TARGET_DIR}/etc/wpa_supplicant
wpa_passphrase ${WPA_SUPP_SSID} ${WPA_SUPP_PASS} > ${TARGET_DIR}/etc/wpa_supplicant/wpa_supplicant-wlan0.conf
