#----------------------------------------------------------------------
# import from CAF device/qcom/msm8660_surf/BoardConfig.mk
#----------------------------------------------------------------------

BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

TARGET_USE_HDMI_AS_PRIMARY := false

ifeq ($(TARGET_USE_HDMI_AS_PRIMARY),true)
    TARGET_HAVE_HDMI_OUT := false
else
    TARGET_HAVE_HDMI_OUT := false
endif # TARGET_USE_HDMI_AS_PRIMARY

# Target info
TARGET_USES_OVERLAY := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Platform
TARGET_HARDWARE_3D := false
TARGET_BOARD_PLATFORM := msm8660
TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Kernel info
BOARD_KERNEL_BASE := 0x40200000
BOARD_KERNEL_PAGESIZE := 2048

# Misc info
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USES_UNCOMPRESSED_KERNEL := false
TARGET_USES_LAUNCHER_V1 := true

# Graphics
BOARD_EGL_CFG := device/pantech/presto/prebuilt/system/lib/egl/egl.cfg

# Scorpion optimizations
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
# Set to 9 for 8650A
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128

HAVE_CYTTSP_FW_UPGRADE := true

# Add NON-HLOS files for ota upgrade
ADD_RADIO_FILES ?= false

