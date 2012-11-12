# Copyright (C) 2010 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for presto hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/pantech/presto/presto-vendor.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

#============================================

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/pantech/presto/prebuilt/kernel/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel

#============================================

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#============================================

# Bluetooth configuration files
BUILT_PREBUILD += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# Charger
BUILT_PREBUILD += \
	$(LOCAL_PATH)/lpm/lpm.rc:root/lpm.rc \
	$(LOCAL_PATH)/lpm/init.qcom.lpm_boot.sh:root/init.qcom.lpm_boot.sh

# Configuration scripts
BUILT_PREBUILD += \
	$(LOCAL_PATH)/recovery.fstab:root/recovery.fstab \
	$(LOCAL_PATH)/fstab.msm8660:root/fstab.msm8660 \

# Custom init / uevent
BUILT_PREBUILD += \
	$(LOCAL_PATH)/config/init.target.rc:system/etc/init.target.rc \
	$(LOCAL_PATH)/config/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
	$(LOCAL_PATH)/config/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh

# IDC
BUILT_PREBUILD += \
	$(LOCAL_PATH)/prebuilt/system/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
	$(LOCAL_PATH)/prebuilt/system/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
	$(LOCAL_PATH)/prebuilt/system/usr/idc/pantech_earjack.idc:system/usr/idc/pantech_earjack.idc

# Keychars
BUILT_PREBUILD += \
	$(LOCAL_PATH)/prebuilt/system/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
	$(LOCAL_PATH)/prebuilt/system/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
	$(LOCAL_PATH)/prebuilt/system/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
	$(LOCAL_PATH)/prebuilt/system/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

# keylayouts
BUILT_PREBUILD += \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/8660_handset.kl:system/usr/keylayout/8660_handset.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/ffa-keypad.kl:system/usr/keylayout/ffa-keypad.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
	$(LOCAL_PATH)/prebuilt/system/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl

# Needed to reset bootmode when leaving recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/system/bin/postrecoveryboot.sh

# vold
BUILT_PREBUILD += \
	$(LOCAL_PATH)/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

# WiFi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

#============================================

# bugmailer
PRODUCT_PACKAGES += send_bug
BUILT_PREBUILD += \
	system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
	system/extras/bugmailer/send_bug:system/bin/send_bug

# Misc
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Wallpapers
PRODUCT_PACKAGES += \
	Galaxy4 \
	HoloSpiralWallpaper \
	MagicSmokeWallpapers \
	NoiseField \
	PhaseBeam

#fstab.qcom
PRODUCT_PACKAGES += \
	fstab.qcom

# Torch
PRODUCT_PACKAGES += \
	Apollo \
	Torch

#============================================

# inherit qcom common
$(call inherit-product-if-exists, device/pantech/qcom-common/qcom-common.mk)

