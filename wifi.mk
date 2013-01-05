# Wifi related defines
BOARD_WLAN_DEVICE                   := bcm4329
BOARD_WLAN_DEVICE_REV               := bcm4329
BOARD_WPA_SUPPLICANT_DRIVER         := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB    := lib_driver_cmd_wext
WIFI_BAND                           := 802_11_ABG
WIFI_DRIVER_FW_PATH_AP              := "/etc/wl/bcm43291_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM           := "/sys/module/wlan/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA             := "/etc/wl/bcm43291.bin"
WIFI_DRIVER_MODULE_ARG              := "firmware_path=/etc/wl/bcm43291.bin nvram_path=/etc/wl/nvram.txt iface_name=wlan"
WIFI_DRIVER_MODULE_NAME             := "wlan"
WIFI_DRIVER_MODULE_PATH             := "/system/lib/modules/wlan.ko"
WPA_SUPPLICANT_VERSION              := VER_0_8_X
