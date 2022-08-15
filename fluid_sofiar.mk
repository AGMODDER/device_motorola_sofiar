# Copyright (C) 2010 The Android Open Source Project
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

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

PRODUCT_EXTRA_VNDK_VERSIONS := 29

VENDOR_EXCEPTION_PATHS := fluid \
    motorola \
    gapps

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Inherit some common Lineage stuff
$(call inherit-product, vendor/fluid/config/common_full_phone.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_PRODUCT_IMAGE  := true
PRODUCT_BUILD_ODM_IMAGE := false

# tell update_engine to not change dynamic partition table during updates
# needed since our qti_dynamic_partitions does not include
# vendor and odm and we also dont want to AB update them
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# enable to generate super_empy.img if needed to wipe super partition table
#BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST += \
    vendor

PRODUCT_BUILD_RAMDISK_IMAGE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
TARGET_NO_RECOVERY := false
#BOARD_INCLUDE_RECOVERY_DTBO = true
BOARD_BUILD_RETROFIT_DYNAMIC_PARTITIONS_OTA_PACKAGE := false
BOARD_USES_RECOVERY_AS_BOOT := false

# A/B
AB_OTA_UPDATER := true

# Inherit from Sofiar device
$(call inherit-product, device/motorola/sofiar/device.mk)

PRODUCT_SHIPPING_API_LEVEL := 29

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := fluid_sofiar
PRODUCT_DEVICE := sofiar
PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola
PRODUCT_MODEL := moto g8 power

TARGET_DEVICE := Moto G8 Power
PRODUCT_SYSTEM_NAME := Moto G8 Power

# Fingerprint
VENDOR_RELEASE := 10/QPE30.79-25/59f4f:user/release-keys
BUILD_FINGERPRINT := motorola/sofiar_retail/sofiar:$(VENDOR_RELEASE)

PLATFORM_SECURITY_PATCH_OVERRIDE := 2019-12-01

TARGET_VENDOR := motorola

# Properties
PRODUCT_PRODUCT_PROPERTIES += \
    debug.sf.enable_gl_backpressure=0 \
    debug.sf.enable_hwc_vds=0 \
    debug.sf.latch_unsignaled=1 \
    vendor.camera.aux.packagelist=com.android.settings,com.motorola.camera2,com.motorola.camera3 \
    ro.config.use_compaction=true \
    ro.config.compact_action_1=4 \
    ro.config.compact_action_2=2 \
    ro.lmk.kill_heaviest_task=true \
    ro.lmk.thrashing_limit=60 \
    ro.lmk.swap_free_low_percentage=20 \
    ro.lmk.swap_util_max=80 \
    ro.lmk.psi_complete_stall_ms=80

# Vendor Proprietary
$(call inherit-product, vendor/motorola/sofiar/sofiar-vendor.mk)

# BootAnimation
TARGET_BOOT_ANIMATION_RES := 1080

# Gapps
TARGET_GAPPS_ARCH := arm64
WITH_GAPPS := true
