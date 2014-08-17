# Wifi related defines

BOARD_WPA_SUPPLICANT_DRIVER         := WEXT
WPA_SUPPLICANT_VERSION              := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB    := lib_driver_cmd_wext
BOARD_HOSTAPD_DRIVER                := WEXT
BOARD_HOSTAPD_PRIVATE_LIB           := lib_driver_cmd_wext
BOARD_WLAN_DEVICE                   := bcm4329
#BOARD_WLAN_DEVICE_REV              := bcm4329
BOARD_WLAN_USE_WEXT_DRIVER          := true
WIFI_BAND                           := 802_11_ABG

WIFI_DRIVER_MODULE_PATH             := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME             := "wlan"
WIFI_DRIVER_MODULE_ARG              := "firmware_path=/system/etc/wl/bcm43291.bin nvram_path=/system/etc/wl/nvram.txt"
WIFI_DRIVER_MODULE_AP_ARG           := "firmware_path=/system/etc/wl/bcm43291_apsta.bin nvram_path=/system/etc/wl/nvram.txt"
WIFI_DRIVER_FW_PATH_PARAM           := "/sys/module/wlan/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA             := "/system/etc/wl/bcm43291.bin"
WIFI_DRIVER_FW_PATH_AP              := "/system/etc/wl/bcm43291_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P             := "/system/etc/wl/bcm43291_p2p.bin"

WIFI_EXT_MODULE_PATH                := "/system/lib/modules/librasdioif.ko"
WIFI_EXT_MODULE_NAME                := "librasdioif"

BOARD_HAVE_PRESTO_WIFI              := true
