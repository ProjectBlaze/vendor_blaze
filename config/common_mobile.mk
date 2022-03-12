# Inherit common mobile blaze stuff
$(call inherit-product, vendor/blaze/config/common.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    Email \
    ExactCalculator \
    Exchange2

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet