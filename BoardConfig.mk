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

# inherit from the proprietary version
-include vendor/pantech/presto/BoardConfigVendor.mk

# Headers path
TARGET_SPECIFIC_HEADER_PATH := device/pantech/presto/include

# Assert
TARGET_OTA_ASSERT_DEVICE := PantechP9070,presto

#----------------------------------------------------------------------

# Audio
BOARD_USES_ALSA_AUDIO := false
BOARD_USES_AUDIO_LEGACY := true
BOARD_USES_QCOM_AUDIO_V2 := true
TARGET_PROVIDES_LIBAUDIO := true
TARGET_USES_QCOM_LPA := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BT_ALT_STACK := true
BRCM_BT_USE_BTL_IF := true
BRCM_BTL_INCLUDE_A2DP := true

# Camera
BOARD_CAMERA_USE_MM_HEAP := true
BOARD_NEEDS_MEMORYHEAPPMEM := true

# Charging mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGER_RES := device/pantech/presto/prebuilt/root/res/images/charger

# Flags
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DQCOM_ACDB_ENABLED
COMMON_GLOBAL_CFLAGS += -DWITH_QCOM_LPA
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_FM_DEVICE := bcm4329
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm8660
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true

# liblights on QCOM platforms
TARGET_PROVIDES_LIBLIGHTS := true

#LLVM for RenderScript use qcom LLVM
BOARD_USE_QCOM_LLVM_CLANG_RS := false

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_USE_QCOM_TESTONLY := true
BOARD_USES_QCNE := true
BOARD_USES_QCOM_LIBS := true
TARGET_HAS_S3D_SUPPORT := true
PROTEUS_DEVICE_API := true

# QCOM adreno
BOARD_USES_ADRENO_200 := true
HAVE_ADRENO200_SOURCE := true
HAVE_ADRENO200_SC_SOURCE := true
HAVE_ADRENO200_FIRMWARE := true

# Sensors
#BOARD_USES_GENERIC_INVENSENSE := false
#SOMC_CFG_DASH_INCLUDED := yes
#SENSORS_ACCEL_BMA250_INPUT := true

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true
DYNAMIC_SHARED_LIBV8SO := false

# Wifi related defines
BOARD_WLAN_DEVICE                := bcm4329
BOARD_WLAN_DEVICE_REV            := bcm4329
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WIFI_BAND                        := 802_11_ABG
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcm4329/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/etc/wl/nvram.tx iface_name=wlan"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WPA_SUPPLICANT_VERSION           := VER_0_8_X

#----------------------------------------------------------------------

# use toolchain 4.4.3 for kernel compile
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3

# Define Prebuilt kernel locations
TARGET_PREBUILT_KERNEL := device/pantech/presto/prebuilt/kernel/kernel

# Built from source kernel
TARGET_KERNEL_CONFIG := cyanogenmod_presto_defconfig
TARGET_KERNEL_SOURCE := kernel/pantech/p9070

# Kernel info
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom loglevel=0
BOARD_FORCE_RAMDISK_ADDRESS := 0x41500000

#----------------------------------------------------------------------

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00700000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00700000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# From /proc/partitions (each were multiplied by 1024)
BOARD_SYSTEMIMAGE_PARTITION_SIZE     := 617193472   #614400x1024
BOARD_USERDATAIMAGE_PARTITION_SIZE   := 1073741824  #1048576x1024
BOARD_PERSISTIMAGE_PARTITION_SIZE    := 8388608     #8192x1024
BOARD_CACHEIMAGE_PARTITION_SIZE      := 178257920   #174080x1024
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 268435456   #262144x1024

#----------------------------------------------------------------------

# Bootloader and recovery

# Use signed boot and recovery image
#TARGET_BOOTIMG_SIGNED := false

TARGET_BOOTLOADER_BOARD_NAME := presto
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_qcom

#BOARD_CUSTOM_GRAPHICS := ../../../device/pantech/presto/recovery/graphics.c
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USES_MMCUTILS := true
#BOARD_USES_RECOVERY_CHARGEMODE := false

# SD Card info
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p1

#----------------------------------------------------------------------
# inherit device/qcom/msm8660_surf/BoardConfig.mk
#----------------------------------------------------------------------

-include device/pantech/presto/BoardConfigCommon.mk

