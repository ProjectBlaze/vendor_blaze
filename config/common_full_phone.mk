# Inherit full common blaze stuff
$(call inherit-product, vendor/blaze/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include blaze LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/blaze/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

$(call inherit-product, vendor/blaze/config/telephony.mk)