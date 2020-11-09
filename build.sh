#!/bin/bash

CROSS_COMPILE=arm-linux-gnueabihf-
ARCH=arm

PRI="CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm"
#make ${PRI} imx_alientek_emmc_defconfig
make ${PRI} menuconfig
make ${PRI} zImage -j16

make ${PRI} dtbs
cat arch/arm/boot/dts/imx6ull-14x14-emmc-7-1024x600-c.dtb >> arch/arm/boot/zImage
cp arch/arm/boot/dts/imx6ull-14x14-emmc-7-1024x600-c.dtb /tftp/imx6ull-14x14-emmc-4.3-480x272-c.dtb

cp arch/arm/boot/zImage /tftp
cp /tftp/* /imxroot


