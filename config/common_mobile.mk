# Inherit common mobile blaze stuff
$(call inherit-product, vendor/blaze/config/common.mk)

# Themes
PRODUCT_PACKAGES += \
    ThemePicker \
    ThemesStub

# Customizations
PRODUCT_PACKAGES += \
    NavigationBarMode2ButtonOverlay \
    NavigationBarNoHintOverlay
