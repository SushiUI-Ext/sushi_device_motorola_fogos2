#!/usr/bin/env bash

#
# Copyright (c) 2026 SushiUI Extended 
# All rights reserved

DEVICE="fogos_variant2"
VERSION="1.1.2"
VENDOR="motorola"
VARIANT="variant2"
AB="true"
RESOLUTION="720x1600"
SOC="QTI SM6375"
ARCHITECTURES="aarch64,armeabi-v7a,armeabi"
LATEST_SDK="35"
FIRST_SDK="34"
BUILDNO="V1UGS35H.75-14-6-2-4"
BUILD_SDK="35"
MIN_SDK="36"
VERSION_CODE="10102"
# color variables
RED="\e[31m"
GREEN="\e[32m"
RESET="\e[0m"
BLUE="\e[34m"
# functions (commands)
sushidevinfo() {
  echo -e "Device ${BLUE}$DEVICE${RESET} info"
  echo -e "SoC: $SOC"
  echo -e "SushiUI version: $VERSION"
  echo -e "A/B: $AB"
  echo -e "Architectures: $ARCHITECTURES"
}

smake() {
    local -a MAKEFLAGS=()

    local arg
    local has_jobs=0

    for arg in "$@"; do
        case "$arg" in
            -j|--jobs)
                has_jobs=1
                ;;
            -j[0-9]*|--jobs=[0-9]*)
                has_jobs=1
                ;;
        esac
    done

    if (( !has_jobs )); then
        MAKEFLAGS+=("-j$(nproc)")
    fi

    command make "${MAKEFLAGS[@]}" "$@"
}
