# Inherit common blaze stuff
$(call inherit-product, vendor/blaze/config/common_mobile.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder