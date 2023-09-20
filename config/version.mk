# Copyright (C) 2022-2023 ProjectBlaze
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ANDROID_VERSION := 13
BLAZEVERSION := v2.10-DAWN

BLAZE_BUILD_TYPE ?= UNOFFICIAL
BLAZE_MAINTAINER ?= UNKNOWN
BLAZE_DATE_YEAR := $(shell date -u +%Y)
BLAZE_DATE_MONTH := $(shell date -u +%m)
BLAZE_DATE_DAY := $(shell date -u +%d)
BLAZE_DATE_HOUR := $(shell date -u +%H)
BLAZE_DATE_MINUTE := $(shell date -u +%M)
BLAZE_BUILD_DATE := $(BLAZE_DATE_YEAR)$(BLAZE_DATE_MONTH)$(BLAZE_DATE_DAY)-$(BLAZE_DATE_HOUR)$(BLAZE_DATE_MINUTE)
TARGET_PRODUCT_SHORT := $(subst blaze_,,$(BLAZE_BUILD))

# OFFICIAL_DEVICES
ifeq ($(BLAZE_BUILD_TYPE), OFFICIAL)
  LIST = $(shell cat vendor/blaze/blaze.devices)
    ifeq ($(filter $(BLAZE_BUILD), $(LIST)), $(BLAZE_BUILD))
      IS_OFFICIAL=true
      BLAZE_BUILD_TYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
      BLAZE_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(BLAZE_BUILD)")
    endif
endif

BLAZE_VERSION := $(BLAZEVERSION)-$(BLAZE_BUILD)-$(BLAZE_BUILD_DATE)-VANILLA-$(BLAZE_BUILD_TYPE)
ifeq ($(WITH_GAPPS), true)
BLAZE_VERSION := $(BLAZEVERSION)-$(BLAZE_BUILD)-$(BLAZE_BUILD_DATE)-GAPPS-$(BLAZE_BUILD_TYPE)
endif
BLAZE_MOD_VERSION :=$(ANDROID_VERSION)-$(BLAZEVERSION)
BLAZE_DISPLAY_VERSION := ProjectBlaze-$(BLAZEVERSION)-$(BLAZE_BUILD_TYPE)
BLAZE_DISPLAY_BUILDTYPE := $(BLAZE_BUILD_TYPE)
BLAZE_FINGERPRINT := ProjectBlaze/$(BLAZE_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(BLAZE_BUILD_DATE)

# BLAZE System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.blaze.version=$(BLAZE_DISPLAY_VERSION) \
  ro.blaze.build.status=$(BLAZE_BUILD_TYPE) \
  ro.modversion=$(BLAZE_MOD_VERSION) \
  ro.blaze.build.date=$(BLAZE_BUILD_DATE) \
  ro.blaze.buildtype=$(BLAZE_BUILD_TYPE) \
  ro.blaze.fingerprint=$(BLAZE_FINGERPRINT) \
  ro.blaze.device=$(BLAZE_BUILD) \
  org.blaze.version=$(BLAZEVERSION) \
  ro.blaze.maintainer=$(BLAZE_MAINTAINER)
