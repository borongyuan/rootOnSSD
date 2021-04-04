#!/bin/sh
# Runs at startup, switches rootfs to the SSD
SSD_DRIVE="/dev/sda"
CHROOT_PATH="/ssdroot"

INITBIN=/lib/systemd/systemd
EXT4_OPT="-o defaults -o errors=remount-ro -o discard"

modprobe ext4

mkdir -p ${CHROOT_PATH}
mount -t ext4 ${EXT4_OPT} ${SSD_DRIVE} ${CHROOT_PATH}

cd ${CHROOT_PATH}
/bin/systemctl --no-block switch-root ${CHROOT_PATH}
