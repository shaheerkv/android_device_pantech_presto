#
# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#----------------------------------------------------------------------

USE_CAMERA_STUB := true

BOARD_VENDOR := pantech

# inherit from the proprietary version
-include vendor/pantech/presto/BoardConfigVendor.mk

# Headers path
TARGET_SPECIFIC_HEADER_PATH := device/pantech/presto/include

# Camera parameters path
BOARD_CAMERA_EXTRA_PARAMETERS_PATH := device/pantech/presto/camera

# inherit from pantech msm8660-common
-include device/pantech/msm8660-common/BoardConfigCommon.mk

#----------------------------------------------------------------------

# Assert
TARGET_OTA_ASSERT_DEVICE := PantechP9070,presto

#Audio
BOARD_HAVE_PRESTO_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/pantech/presto/bluetooth/
BOARD_BLUEDROID_VENDOR_CONF := device/pantech/presto/bluetooth/vnd_bt.txt

# Board info
BOARD_HAS_NO_SELECT_BUTTON := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8660_SURF

# Camera
BOARD_PANTECH_CAMERA := true
BOARD_CAMERA_USE_MM_HEAP := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DPANTECH_PRESTO_CAMERA -DNEEDS_VECTORIMPL_SYMBOLS
TARGET_DISABLE_ARM_PIE := true

# Camera wrapper
#COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# File system
BOARD_BOOTIMAGE_PARTITION_SIZE          := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE      := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE        := 617193472    # 614400×1024   (mmcblk0p13)
BOARD_USERDATAIMAGE_PARTITION_SIZE      := 1073741824   # 1048576×1024  (mmcblk0p14)
BOARD_PERSISTIMAGE_PARTITION_SIZE       := 8388608      # 8192×1024     (mmcblk0p15)
BOARD_CACHEIMAGE_PARTITION_SIZE         := 178257920    # 174080×1024   (mmcblk0p16)
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE    := 268435456    # 262144×1024   (mmcblk0p17)
BOARD_FLASH_BLOCK_SIZE                  := 131072       # (BOARD_KERNEL_PAGESIZE * 64)

# FM radio
#BOARD_HAVE_FM_RADIO := true
#BOARD_HAVE_QCOM_FM := true
#COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

# Graphics
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# HDMI
TARGET_HAVE_HDMI_OUT := false
TARGET_QCOM_HDMI_OUT := false

# Kernel
BOARD_KERNEL_BASE               := 0x40200000
BOARD_KERNEL_CMDLINE            := console=ttyHSL0,115200,n8 androidboot.hardware=qcom kgsl.mmutype=gpummu vmalloc=400M loglevel=0  androidboot.selinux=permissive androidboot.baseband=csfb
BOARD_KERNEL_PAGESIZE           := 2048
BOARD_MKBOOTIMG_ARGS            := --ramdisk_offset 0x01400000
TARGET_KERNEL_CONFIG            := liquid_presto_defconfig
#TARGET_KERNEL_CUSTOM_TOOLCHAIN  := arm-eabi-4.4.3
TARGET_KERNEL_SOURCE            := kernel/pantech/msm8660-common
TARGET_PREBUILT_KERNEL          := device/pantech/presto/prebuilt/kernel/kernel

# Radio fixes
BOARD_RIL_CLASS := ../../../device/pantech/presto/ril/PantechQualcommUiccRIL.java

# SD Card info
BOARD_SDCARD_DEVICE_PRIMARY     := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY   := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE              := /dev/block/mmcblk1p1

# Target info
TARGET_QCOM_AUDIO_VARIANT   := caf
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_QCOM_MEDIA_VARIANT   := caf

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28
BOARD_SUPPRESS_EMMC_WIPE := true

# Wifi
-include device/pantech/presto/wifi/board-bcm.mk
