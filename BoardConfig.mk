#
# Copyright 2014 The Android Open-Source Project
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

# Use the non-open-source parts, if they're present
-include vendor/rockchip/rk3328/BoardConfigVendor.mk
-include device/rockchip/common/BoardConfig.mk

TARGET_PREBUILT_KERNEL := kernel/arch/arm64/boot/Image

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_BOARD_PLATFORM := rk3328
TARGET_BOARD_PLATFORM_GPU := mali450

# Disable emulator for "make dist" until there is a 64-bit qemu kernel
BUILD_EMULATOR := false

#MALLOC_IMPL := dlmalloc
MALLOC_SVELTE := true

# Copy RK3328 own init.rc file
# TARGET_PROVIDES_INIT_RC := true

GRAPHIC_MEMORY_PROVIDER := dma_buf

//MAX-SIZE=800M, for generate out/.../system.img
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1208860800

DEVICE_PACKAGE_OVERLAYS += device/rockchip/rk3328/overlay

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    WITH_DEXPREOPT := true
  else
    WITH_DEXPREOPT := false
  endif
endif

ENABLE_CPUSETS := true

BOARD_WITH_MEM_OPTIMISE := true

PRODUCT_HAVE_OPTEE := true


