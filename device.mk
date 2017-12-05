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

PRODUCT_PACKAGES += \
    libion \
    memtrack.$(TARGET_BOARD_PLATFORM) \

#enable this for support f2fs with data partion
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# This ensures the needed build tools are available.
# TODO: make non-linux builds happy with external/f2fs-tool; system/extras/f2fs_utils
ifeq ($(HOST_OS),linux)
  TARGET_USERIMAGES_USE_F2FS := true
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rk3328.rc:root/init.rk3328.rc \
    $(LOCAL_PATH)/init.rk30board.usb.rc:root/init.rk30board.usb.rc \
    $(LOCAL_PATH)/wake_lock_filter.xml:system/etc/wake_lock_filter.xml \
    device/rockchip/rk3328/package_performance.xml:$(TARGET_COPY_OUT_OEM)/etc/package_performance.xml \
    device/rockchip/$(TARGET_BOARD_PLATFORM)/media_profiles_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    device/rockchip/rk3328/ff1b0030_pwm.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/ff1b0030_pwm.kl \
    device/rockchip/rk3328/ff1b0030_pwm.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/ff1b0030_pwm.idc

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)


$(call inherit-product-if-exists, vendor/rockchip/rk3328/device-vendor.mk)

#for enable optee support
ifeq ($(strip $(PRODUCT_HAVE_OPTEE)),true)

PRODUCT_COPY_FILES += \
       device/rockchip/common/init.optee_verify.rc:root/init.optee.rc
endif

#tv_core_hardware_3328
ifeq ($(strip $(TARGET_PRODUCT)),rk3328)
PRODUCT_COPY_FILES += \
    device/rockchip/rk3328/permissions/tv_core_hardware_3328.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tv_core_hardware_3328.xml
endif

#
#add Rockchip properties here
#
PRODUCT_PROPERTY_OVERRIDES += \
		ro.ril.ecclist=112,911 \
		wifi.interface=wlan0 \
		rild.libpath=/system/lib/libril-rk29-dataonly.so \
		rild.libargs=-d /dev/ttyACM0 \
		persist.tegra.nvmmlite = 1 \
		ro.audio.monitorOrientation=true \
		debug.nfc.fw_download=false \
		debug.nfc.se=false \
		ro.rk.screenoff_time=60000 \
		ro.rk.screenshot_enable=true \
		ro.rk.def_brightness=200 \
		ro.rk.homepage_base=http://www.google.com/webhp?client={CID}&amp;source=android-home \
		ro.rk.install_non_market_apps=false \
		sys.hwc.compose_policy=6 \
		sys.wallpaper.rgb565=0 \
		sf.power.control=2073600 \
		sys.rkadb.root=0 \
		ro.sf.fakerotation=false \
		ro.sf.hwrotation=0 \
		ro.rk.MassStorage=false \
		ro.rk.systembar.voiceicon=true \
		ro.rk.systembar.tabletUI=false \
		ro.rk.LowBatteryBrightness=false \
		ro.tether.denied=false \
		sys.resolution.changed=false \
		ro.default.size=100 \
		ro.product.usbfactory=rockchip_usb \
		wifi.supplicant_scan_interval=15 \
		ro.factory.tool=0 \
		ro.kernel.android.checkjni=0 \
		ro.sf.lcd_density=240 \
		ro.adb.secure=0 \
		persist.enable_task_snapshots=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.hwui.drop_shadow_cache_size=4.0 \
    ro.hwui.gradient_cache_size=0.8 \
    ro.hwui.layer_cache_size=32.0 \
    ro.hwui.path_cache_size=24.0 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=512 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.texture_cache_size=48.0 \

