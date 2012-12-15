#----------------------------------------------------------------------
# import from CAF device/qcom/msm8660_surf/msm8660_surf.mk
#----------------------------------------------------------------------

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# Wallpapers
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam

# fstab.qcom
PRODUCT_PACKAGES += \
    fstab.qcom

#----------------------------------------------------------------------
# inherit device/qcom/common/common.mk
#----------------------------------------------------------------------

$(call inherit-product-if-exists, device/pantech/presto/qcom-common.mk)

