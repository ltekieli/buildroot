#!/bin/bash

set -euo pipefail

make distclean
make custom_raspberrypi3_defconfig
make
make sdk
