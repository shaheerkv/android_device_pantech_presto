#----------------------------------------------------------------------
# import from CAF device/qcom/msm8660_surf/AndroidBoard.mk
#----------------------------------------------------------------------

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

#----------------------------------------------------------------------
# Key mappings
#----------------------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE       := ffa-keypad.kl
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := prebuilt/system/usr/keylayout/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fluid-keypad.kl
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := prebuilt/system/usr/keylayout/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		:= 8660_handset.kl
LOCAL_MODULE_TAGS	:= optional
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= prebuilt/system/usr/keylayout/$(LOCAL_MODULE)
LOCAL_MODULE_PATH	:= $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		:= cyttsp-i2c.kl
LOCAL_MODULE_TAGS	:= optional
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= prebuilt/system/usr/keylayout/$(LOCAL_MODULE)
LOCAL_MODULE_PATH	:= $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_SRC_FILES		:= prebuilt/system/usr/keychars/ffa-keypad_qwerty.kcm
LOCAL_MODULE_TAGS	:= optional
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES		:= prebuilt/system/usr/keychars/ffa-keypad_numeric.kcm
LOCAL_MODULE_TAGS	:= optional
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES		:= prebuilt/system/usr/keychars/fluid-keypad_qwerty.kcm
LOCAL_MODULE_TAGS	:= optional
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES		:= prebuilt/system/usr/keychars/fluid-keypad_numeric.kcm
LOCAL_MODULE_TAGS	:= optional
include $(BUILD_KEY_CHAR_MAP)

#----------------------------------------------------------------------
# Configuration scripts
#----------------------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.qcom
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := vold.fstab
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := prebuilt/system/etc/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

#----------------------------------------------------------------------
# Radio image
#----------------------------------------------------------------------

ifeq ($(ADD_RADIO_FILES), true)
radio_dir := $(LOCAL_PATH)/radio
RADIO_FILES := $(shell cd $(radio_dir) ; ls)
$(foreach f, $(RADIO_FILES), \
    $(call add-radio-file,radio/$(f)))
endif

#----------------------------------------------------------------------
# extra images
#----------------------------------------------------------------------

#-include device/pantech/qcom-common/generate_extra_images.mk

