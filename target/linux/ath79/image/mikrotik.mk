define Device/mikrotik
  DEVICE_VENDOR := Mikrotik
  BOARD_NAME := routerboard
  LOADER_TYPE := elf
#  KERNEL_NAME := vmlinux.bin.lzma
  KERNEL := kernel-bin | append-dtb | lzma | loader-kernel
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-kernel
#  KERNEL := $(KERNEL_DTB) | loader-kernel
#  KERNEL_INITRAMFS_NAME := vmlinux-initramfs.bin.lzma
  IMAGE/sysupgrade.bin/squashfs :=
endef

define Device/mikrotik_sxtsq-lite60
  $(Device/mikrotik)
  ATH_SOC := qca9531
  DEVICE_MODEL := MikroTik SXTsq Lite60
#  DEVICE_PACKAGES := rbcfg rssileds -nand-utils kmod-ledtrig-gpio
  IMAGE_SIZE := 16000k
  KERNEL_INSTALL := 1
  SUPPORTED_DEVICES := rb-750-r2 rb-750up-r2 rb-750p-pbr2 rb-911-2hn rb-911-5hn rb-931-2nd rb-941-2nd rb-951ui-2nd rb-952ui-5ac2nd rb-962uigs-5hact2hnt rb-lhg-5nd rb-map-2nd rb-mapl-2nd rb-wap-2nd rb-wapr-2nd rb-sxt-2nd-r3
#  IMAGE/sysupgrade.bin := append-kernel | kernel2minor -s 1024 -e | pad-to $$$$(BLOCKSIZE) | \
#	append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
endef
TARGET_DEVICES += mikrotik_sxtsq-lite60

