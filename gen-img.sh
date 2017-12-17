#!/bin/sh
#----------------------------------------------------------

TOPDIR=`pwd`
MKE4FS=make_ext4fs
RAMDISK=${TOPDIR}/ramdisk.img
RAMDISK_UBOOT=ramdisk-u.img

#----------------------------------------------------------
# ramdisk (uboot) image
echo "Generating `basename ${RAMDISK}`..."

tar xf ramdisk-extra.tgz -C ramdisk
(cd ramdisk && find . | cpio --quiet -H newc -o | gzip > ${RAMDISK})

mkimage -A arm -O linux -T ramdisk -C none -a 0x40800000 \
	-n "ramdisk" -d ${RAMDISK} ${RAMDISK_UBOOT}

echo "...done."


