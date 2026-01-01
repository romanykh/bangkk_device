LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := vendor_nfc_module
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)

# depmod must exist on host
LOCAL_HOST_REQUIRED_MODULES := depmod

LOCAL_POST_INSTALL_CMD := \
    mkdir -p $(TARGET_OUT_VENDOR)/lib/modules; \
    rm -f $(TARGET_OUT_VENDOR)/lib/modules/sec_nfc.ko; \
    cp -f $(LOCAL_PATH)/sec_nfc.ko \
          $(TARGET_OUT_VENDOR)/lib/modules/; \
    echo "Running depmod (no kernel version)"; \
    $(DEPMOD) -b $(TARGET_OUT_VENDOR);

include $(BUILD_PHONY_PACKAGE)
