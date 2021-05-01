# Copyright (C) 2018 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/a40/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a40
PRODUCT_NAME := lineage_a40
PRODUCT_MODEL := a40
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# BUILD_FINGERPRINT := "samsung/m20ltedd/m20lte:10/QP1A.190711.020/M205FDDU5CTF2:user/release-keys"

# PRODUCT_BUILD_PROP_OVERRIDES += \
        PRODUCT_NAME=m20ltedd \
        PRIVATE_BUILD_DESC="m20ltedd-user 10 QP1A.190711.020 M205FDDS6CTH4 release-keys"
        
# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOT_ANIMATION_RES := 1080

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Bluetooth
PRODUCT_PACKAGES += \
    audio.a2dp.default
    
# Call proprietary blob setup
$(call inherit-product-if-exists, device/samsung/a40/a40-vendor.mk)

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
TARGET_EXCLUDES_AUDIOFX := true

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/audio_policy_configuration.xml

# FastCharge
PRODUCT_PACKAGES += \
    lineage.fastcharge@1.0-service.samsung

# Init scripts
PRODUCT_PACKAGES += \
    init.target.rc \
    init.usb_accessory.rc \
    fstab.enableswap

# NFC
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-nci.conf:system/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc_key:system/etc/nfc_key \
    $(LOCAL_PATH)/configs/nfcee_access.xml:system/etc/nfcee_access.xml

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.software.controls.xml:system/etc/permissions/android.software.controls.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service.universal7904

# Recovery
PRODUCT_PACKAGES += \
    fastbootd \
    init.recovery.exynos7904.rc

# SamsungDoze
PRODUCT_PACKAGES += \
    SamsungDoze

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl.samsung-universal7904

# Skip Mount
PRODUCT_COPY_FILES += \
    build/target/product/gsi/gsi_skip_mount.cfg:system/system_ext/etc/init/config/skip_mount.cfg

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# System properties
-include $(LOCAL_PATH)/product_prop.mk

# Trust HAL
PRODUCT_PACKAGES += \
    lineage.trust@1.0-service

# Touch
PRODUCT_PACKAGES += \
    lineage.touch@1.0-service.samsung

# Wifi
PRODUCT_PACKAGES += \
    TetheringConfigOverlay

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 29

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vndkcore.libraries.29.txt:system/system_ext/apex/com.android.vndk.v29/etc/vndkcore.libraries.29.txt \
    $(LOCAL_PATH)/configs/vndkprivate.libraries.29.txt:system/system_ext/apex/com.android.vndk.v29/etc/vndkprivate.libraries.29.txt \
    $(LOCAL_PATH)/configs/placeholder:system/system_ext/apex/com.android.vndk.v29/lib/libstagefright_foundation.so  
