#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/realme/realme_trinket/realme_trinket-vendor.mk)

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Properties
-include $(LOCAL_PATH)/system_prop.mk
-include $(LOCAL_PATH)/product_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Permissions
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.ims.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/bluetooth_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml

# Board
PRODUCT_USES_QCOM_HARDWARE := true
PRODUCT_BOARD_PLATFORM := trinket

# Camera
PRODUCT_PACKAGES += \
    Snap

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libqdMetaData.system \
    libvulkan

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.realme_trinket

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# Google Apps permissions (TODO: Remove these)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-google.xml:system/etc/permissions/privapp-permissions-google-fix.xml

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# HotwordEnrollement
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Init
PRODUCT_PACKAGES += \
    init.oppo.fingerprint.rc \
    init.qcom.rc \
    init.qcom.post_boot.sh \
    init.safailnet.rc

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/kernel:kernel

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/media_codecs_performance.xml

# Livedisplay
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl.realme_trinket

# Livedisplay
PRODUCT_PACKAGES += \
    lineage.livedisplay@2.0-service-sdm

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    com.nxp.nfc.nq \
    libnqnfc-nci \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
    NfcNci \
    libnqnfc_nci_jni \
    nfc_nci.nqx.default.hw \
    SecureElement \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/libnfc-nci.conf

# Perf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/msm_irqbalance.conf \
    $(LOCAL_PATH)/configs/perf/perfboostsconfig.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/perf/perfboostsconfig.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service.realme_trinket

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/powerhint.xml

# Ril
PRODUCT_PACKAGES += \
    android.hardware.radio@1.4

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    vendor/nxp/opensource/sn100x

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# WiFi Display
PRODUCT_PACKAGES += \
    libnl

PRODUCT_BOOT_JARS += \
    WfdCommon
