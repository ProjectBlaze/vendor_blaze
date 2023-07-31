# Inherit common mobile blaze stuff
$(call inherit-product, vendor/blaze/config/common.mk)

# Include AOSP audio files
include vendor/blaze/config/aosp_audio.mk

# Themes
PRODUCT_PACKAGES += \
    ThemePicker \
    ThemesStub
