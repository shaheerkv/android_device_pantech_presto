#!/bin/sh

CM_DIR=../../../
PATCH_DIR=device/pantech/presto/patchs

cd $CM_DIR

while getopts ":ar" option;
do
    case $option in
        a)
            echo "*** Patch for camera ***" 
            patch -p1 < $PATCH_DIR/cameraparameters.patch
            ## Patch PowerManagerService.java
            echo "*** Patch for proximity sensor ***" 
            patch -p1 < $PATCH_DIR/proximity_sensor.patch
            ## Patch libhardware_legacy
            #patch -p1 < $PATCH_DIR/custom_wific.patch
            echo "*** Patch for wifi.c ***" 
            cd hardware/libhardware_legacy/wifi
            patch -p2 < $CM_DIR/$PATCH_DIR/custom_wific.patch
            echo "*** Patch for bcm4329 ***" 
            cd ../../broadcom/wlan
            patch -p1 < ../../../$PATCH_DIR/bcm4329.patch
            echo "*** Patch for wpa_supplicant_8 ***" 
            cd ../../../external/wpa_supplicant_8
            patch -p1 < ../../$PATCH_DIR/wpa_supplicant_8.patch
            ;;
        r)
            ## patch CameraParameters
            patch -Rp1 < $PATCH_DIR/cameraparameters.patch
            ## Patch PowerManagerService.java
            patch -Rp1 < $PATCH_DIR/proximity_sensor.patch
            ## Patch libhardware_legacy
            #patch -Rp1 < $PATCH_DIR/custom_wific.patch
            cd hardware/libhardware_legacy/wifi
            patch -Rp2 < $CM_DIR/$PATCH_DIR/custom_wific.patch
            cd ../../broadcom/wlan
            patch -Rp1 < ../../../$PATCH_DIR/bcm4329.patch
            cd ../../../external/wpa_supplicant_8
            patch -Rp1 < ../../$PATCH_DIR/wpa_supplicant_8.patch
           ;;
   
        *)
            echo "invalid option -$OPTARG" 
            echo "*****************************"
            echo "-a apply patches"
            echo "-r revert applied patches"
            echo "*****************************"
            ;;
    esac
done