include vendor/blaze/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/blaze/config/BoardConfigQcom.mk
endif

include vendor/blaze/config/BoardConfigSoong.mk
