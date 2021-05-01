DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit common device configuration
$(call inherit-product, device/samsung/a40/lineage_a40.mk)

TARGET_PREBUILT_KERNEL := device/samsung/a40/Image
PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_KERNEL):kernel
