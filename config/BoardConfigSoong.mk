PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/ProjectBlaze/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += blazeVarsPlugin

SOONG_CONFIG_blazeVarsPlugin :=

define addVar
  SOONG_CONFIG_blazeVarsPlugin += $(1)
  SOONG_CONFIG_blazeVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += blazeGlobalVars
SOONG_CONFIG_blazeGlobalVars += \
    additional_gralloc_10_usage_bits \
    camera_needs_client_info \
    camera_needs_client_info_lib \
    gralloc_handle_has_reserved_size \
    needs_camera_boottime \
    target_init_vendor_lib \
    target_inputdispatcher_skip_event_key \
    target_ld_shim_libs \
    target_surfaceflinger_udfps_lib \
    uses_legacy_fd_fbdev \
    needs_oplus_tag \
    uses_egl_display_array \
    uses_oppo_camera

SOONG_CONFIG_NAMESPACES += blazeNvidiaVars
SOONG_CONFIG_blazeNvidiaVars += \
    uses_nv_enhancements

SOONG_CONFIG_NAMESPACES += blazeQcomVars
SOONG_CONFIG_blazeQcomVars += \
    supports_extended_compress_format \
    uses_pre_uplink_features_netmgrd \
    uses_qti_camera_device

# Only create display_headers_namespace var if dealing with UM platforms to avoid breaking build for all other platforms
ifneq ($(filter $(UM_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_blazeQcomVars += \
    qcom_display_headers_namespace
endif

# Soong bool variables
SOONG_CONFIG_blazeGlobalVars_needs_camera_boottime := $(TARGET_CAMERA_BOOTTIME_TIMESTAMP)
SOONG_CONFIG_blazeNvidiaVars_uses_nv_enhancements := $(NV_ANDROID_FRAMEWORK_ENHANCEMENTS)
SOONG_CONFIG_blazeGlobalVars_uses_egl_display_array := $(TARGET_USES_EGL_DISPLAY_ARRAY)
SOONG_CONFIG_blazeGlobalVars_needs_oplus_tag := $(TARGET_NEEDS_OPLUS_VENDOR_TAG)
SOONG_CONFIG_blazeGlobalVars_uses_oppo_camera := $(TARGET_USES_OPPO_CAMERA)
SOONG_CONFIG_blazeQcomVars_supports_extended_compress_format := $(AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT)
SOONG_CONFIG_blazeQcomVars_uses_pre_uplink_features_netmgrd := $(TARGET_USES_PRE_UPLINK_FEATURES_NETMGRD)
SOONG_CONFIG_blazeQcomVars_uses_qti_camera_device := $(TARGET_USES_QTI_CAMERA_DEVICE)
SOONG_CONFIG_blazeGlobalVars_camera_needs_client_info := $(TARGET_CAMERA_NEEDS_CLIENT_INFO)
SOONG_CONFIG_blazeGlobalVars_camera_needs_client_info_lib := $(TARGET_CAMERA_NEEDS_CLIENT_INFO_LIB)
SOONG_CONFIG_blazeGlobalVars_gralloc_handle_has_reserved_size := $(TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE)
SOONG_CONFIG_blazeGlobalVars_uses_legacy_fd_fbdev := $(TARGET_USES_LEGACY_FD_FBDEV)

# Set default values
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS ?= 0
TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE ?= false
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_INPUTDISPATCHER_SKIP_EVENT_KEY ?= 0
TARGET_SURFACEFLINGER_UDFPS_LIB ?= surfaceflinger_udfps_lib

# Soong value variables
SOONG_CONFIG_blazeGlobalVars_additional_gralloc_10_usage_bits := $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS)
SOONG_CONFIG_blazeGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_blazeGlobalVars_target_inputdispatcher_skip_event_key := $(TARGET_INPUTDISPATCHER_SKIP_EVENT_KEY)
SOONG_CONFIG_blazeGlobalVars_target_ld_shim_libs := $(subst $(space),:,$(TARGET_LD_SHIM_LIBS))
SOONG_CONFIG_blazeGlobalVars_target_surfaceflinger_udfps_lib := $(TARGET_SURFACEFLINGER_UDFPS_LIB)
ifneq ($(filter $(QSSI_SUPPORTED_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_blazeQcomVars_qcom_display_headers_namespace := vendor/qcom/opensource/commonsys-intf/display
else
SOONG_CONFIG_blazeQcomVars_qcom_display_headers_namespace := $(QCOM_SOONG_NAMESPACE)/display
endif
