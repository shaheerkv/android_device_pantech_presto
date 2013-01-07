# Wifi related defines
BOARD_HOSTAPD_DRIVER                := WEXT
BOARD_HOSTAPD_PRIVATE_LIB           := lib_driver_cmd_wext
BOARD_WLAN_DEVICE                   := bcm4329
BOARD_WLAN_DEVICE_REV               := bcm4329
BOARD_WPA_SUPPLICANT_DRIVER         := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB    := lib_driver_cmd_wext
WIFI_BAND                           := 802_11_ABG
WIFI_DRIVER_FW_PATH_AP              := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM           := "/sys/module/bcm4329/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA             := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_MODULE_ARG              := "firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/vendor/firmware/nvram_net.txt iface_name=wlan"
WIFI_DRIVER_MODULE_NAME             := "bcm4329"
WIFI_DRIVER_MODULE_PATH             := "/system/modules/bcm4329.ko"
WPA_SUPPLICANT_VERSION              := VER_0_8_X
