# Copyright (C) 2014 OptiPop Project
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

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy

# OptiPop property overides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.bg_apps_limit=24 \
    pm.sleep.mode=1 \
    wifi.supplicant_scan_interval=180 \
    windowsmgr.max_events_per_sec=150 \
    debug.performance.tuning=1 \
    ro.ril.power_collapse=1 \
    persist.service.lgospd.enable=0 \
    persist.service.pcsync.enable=0 \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    dalvik.vm.profiler=1 \
    dalvik.vm.isa.arm.features=lpae,div

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/optipop/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/optipop/overlay/$(TARGET_PRODUCT)

# APN
PRODUCT_COPY_FILES += \
    vendor/optipop/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Proprietary latinime lib needed for swyping
PRODUCT_COPY_FILES += \
    vendor/optipop/prebuilt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Backuptool support
PRODUCT_COPY_FILES += \
    vendor/optipop/prebuilt/addon.d/50-optipop.sh:system/addon.d/50-optipop.sh \
    vendor/optipop/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/optipop/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh

# QuickBoot (included automagically for non-oppo qcom devices)
PRODUCT_PACKAGES += \
    QuickBoot \
    init.vanir.quickboot.rc

PRODUCT_COPY_FILES += \
    vendor/optipop/proprietary/common/xbin/sysrw:system/xbin/sysrw \
    vendor/optipop/proprietary/common/xbin/sysro:system/xbin/sysro \
    vendor/optipop/proprietary/common/xbin/optiinteractivegovernorgovernor:system/xbin/optiinteractivegovernorgovernor \
    vendor/optipop/proprietary/common/init.opti.rc:root/init.opti.rc \
    vendor/optipop/proprietary/common/bin/sysinit:system/bin/sysinit \
    vendor/optipop/proprietary/common/etc/init.d/00firsties:system/etc/init.d/00firsties

# Blobs common to all devices
PRODUCT_COPY_FILES += \
    vendor/optipop/proprietary/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/optipop/proprietary/common/xbin/hunter:system/xbin/hunter \
    vendor/optipop/proprietary/common/xbin/testinitd:system/xbin/testinitd \
    vendor/optipop/proprietary/common/xbin/opticheckcpu:system/xbin/opticheckcpu \
    vendor/optipop/proprietary/common/xbin/optinice:system/xbin/optinice

# init.d Tweaks
PRODUCT_COPY_FILES += \
    vendor/optipop/proprietary/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/optipop/proprietary/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/optipop/proprietary/common/etc/init.d/98SONIC_SHOCK:system/etc/init.d/98SONIC_SHOCK \
    vendor/optipop/proprietary/common/etc/init.d/99optimax:system/etc/init.d/99optimax \
    vendor/optipop/proprietary/common/etc/cron/cron.minutely/00nicetweaks:/system/etc/cron/cron.minutely/00nicetweaks \
    vendor/optipop/proprietary/common/etc/cron/cron.daily/00sqlitespeed:/system/etc/cron/cron.daily/00sqlitespeed

# system and persistent /data boot.d Tweaks - triggered when ro.boot_complete is set to 1
PRODUCT_COPY_FILES += \
    vendor/optipop/proprietary/common/bin/userinit:system/bin/userinit \
    vendor/optipop/proprietary/common/etc/boot.d/00optinice:system/etc/boot.d/00optinice

include vendor/optipop/config/sm.mk
