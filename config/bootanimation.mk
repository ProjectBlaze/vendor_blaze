TARGET_BOOT_ANIMATION_RES ?= undefined

ifeq ($(TARGET_BOOT_ANIMATION_RES),480)
     PRODUCT_COPY_FILES += vendor/blaze/prebuilt/bootanimation/720.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/blaze/prebuilt/bootanimation/1080.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/blaze/prebuilt/bootanimation/1080.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/blaze/prebuilt/bootanimation/2160.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),2560)
     PRODUCT_COPY_FILES += vendor/blaze/prebuilt/bootanimation/2560.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),undefined)
     $(warning Target bootanimation res is undefined, using 1080p bootanimation )
     PRODUCT_COPY_FILES += vendor/blaze/prebuilt/bootanimation/1080.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else
     $(warning Defined bootanimation res is wrong, using 1080p bootanimation )
     PRODUCT_COPY_FILES += vendor/blaze/prebuilt/bootanimation/1080.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
endif