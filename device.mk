$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
$(call inherit-product, device/PPTV/KING7/vendor/copyfiles.mk)
$(call inherit-product-if-exists, vendor/PPTV/KING7/KING7-vendor-blobs.mk)

LOCAL_PATH := device/PPTV/KING7

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal xhdpi xxhdpi xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := KING7

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_PACKAGES += \
libxlog

PRODUCT_COPY_FILES += \
   $(LOCAL_KERNEL):prebuilt/kernel

# Init
PRODUCT_PACKAGES += \
    KING7

# Gralloc
PRODUCT_PACKAGES += \
   libgralloc_extra

# Immvibe
PRODUCT_PACKAGES += \
	immvibe

# Hack to fix asec on emulated sdcard
PRODUCT_PACKAGES += \
    asec_helper

# Audio
PRODUCT_PACKAGES += \
    audio_policy.default \
    audio_policy.stub \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix \
    libtinyalsa
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/audio_device.xml:system/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Bluetooth
PRODUCT_PACKAGES += \
    audio.a2dp.default
PRODUCT_PACKAGES += \
    libbt-vendor
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bt_did.conf:system/etc/bluetooth/bt_did.conf

# Keyboard layout
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
     $(LOCAL_PATH)/configs/ACCDET.kl:system/usr/keylayout/ACCDET.kl\
     $(LOCAL_PATH)/configs/AVRCP.kl:system/usr/keylayout/AVRCP.kl

#Light
#PRODUCT_PACKAGES += \
     #lights.mt6795

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/enableswap.sh:root/enableswap.sh \
    $(LOCAL_PATH)/rootdir/default.prop:root/default.prop \
    $(LOCAL_PATH)/rootdir/factory_init.project.rc:root/factory_init.project.rc \
    $(LOCAL_PATH)/rootdir/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/rootdir/file_contexts:root/file_contexts \
    $(LOCAL_PATH)/rootdir/fstab.mt6795:root/fstab.mt6795 \
		$(LOCAL_PATH)/rootdir/init:root/init \
    $(LOCAL_PATH)/rootdir/init.aee.rc:root/init.aee.rc \
    $(LOCAL_PATH)/rootdir/init.cm.rc:root/init.cm.rc \
		$(LOCAL_PATH)/rootdir/init.environ.rc:root/init.environ.rc \
		$(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc  \
    $(LOCAL_PATH)/rootdir/init.mt6595.rc:root/init.mt6595.rc \
		$(LOCAL_PATH)/rootdir/init.mt6795.rc:root/init.mt6795.rc \
		$(LOCAL_PATH)/rootdir/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
		$(LOCAL_PATH)/rootdir/init.project.rc:root/init.project.rc \
		$(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
		$(LOCAL_PATH)/rootdir/init.recovery.mt6795.rc:root/init.recovery.mt6795.rc \
    $(LOCAL_PATH)/rootdir/init.ssd.rc:root/init.ssd.rc\
    $(LOCAL_PATH)/rootdir/init.trace.rc:root/init.trace.rc \
		$(LOCAL_PATH)/rootdir/init.usb.rc:root/init.usb.rc \
		$(LOCAL_PATH)/rootdir/init.trace.rc:root/init.trace.rc \
		$(LOCAL_PATH)/rootdir/init.xlog.rc:root/init.xlog.rc \
		$(LOCAL_PATH)/rootdir/init.zygote32.rc:root/init.zygote32.rc \
		$(LOCAL_PATH)/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc \
		$(LOCAL_PATH)/rootdir/meta_init.modem.rc:root/meta_init.modem.rc \
		$(LOCAL_PATH)/rootdir/meta_init.project.rc:root/meta_init.project.rc \
		$(LOCAL_PATH)/rootdir/meta_init.rc:root/meta_init.rc \
		$(LOCAL_PATH)/rootdir/property_contexts:root/property_contexts \
		$(LOCAL_PATH)/rootdir/seapp_contexts:root/seapp_contexts \
		$(LOCAL_PATH)/rootdir/selinux_version:root/selinux_version \
		$(LOCAL_PATH)/rootdir/sepolicy:root/sepolicy \
		$(LOCAL_PATH)/rootdir/service_contexts:root/service_contexts \
		$(LOCAL_PATH)/rootdir/ueventd.rc:root/ueventd.rc \
		$(LOCAL_PATH)/rootdir/recovery.fstab:root/recovery.fstab \

# Telecom
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml \
    $(LOCAL_PATH)/configs/ecc_list.xml:system/etc/ecc_list.xml \
    $(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml

# Thermal
#PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/configs/.ht120.mtc:system/etc/.tp/.ht120.mtc \
#     $(LOCAL_PATH)/configs/thermal.conf:system/etc/.tp/thermal.conf \
#     $(LOCAL_PATH)/configs/thermal.off.conf:system/etc/.tp/thermal.off.conf \
#     $(LOCAL_PATH)/configs/.thermal_policy_00:system/etc/.tp/.thermal_policy_00 \
#     $(LOCAL_PATH)/configs/.thermal_policy_01:system/etc/.tp/.thermal_policy_01

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    $(LOCAL_PATH)/configs/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    $(LOCAL_PATH)/configs/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/permissions/media_codecs.xml \
	$(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_TAGS += dalvik.gc.type-precise

# Charger
PRODUCT_PACKAGES += \
      charger_res_images

# Wifi
 PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx \
    libwifi-hal-mt66xx \
    wifi_hal \
    libwpa_client \
    hostapd \
    hostapd_cli \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Ifaddrs
PRODUCT_PACKAGES += \
    libifaddrs

# Torch
PRODUCT_PACKAGES += \
    Torch

# STk
PRODUCT_PACKAGES += \
    Stk

# GPS
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml \

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
     ro.adb.secure=0 \
     ro.secure=1 \
     ro.allow.mock.location=1 \
     ro.debuggable=1 \
     ro.zygote=zygote64_32 \
     camera.disable_zsl_mode=1 \
     ro.mount.fs=EXT4 \
     persist.service.acm.enable=0 \
     persist.sys.usb.config=mtp,mass_storage \
     persist.sys.timezone=Asia/Shanghai

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.telephony.ril_class=MediaTekRIL \
    ro.telephony.ril.config=fakeiccid  \
    persist.call_recording.enabled=true \
    persist.call_recording.src=4 \
    persist.debug.wfd.enable=1

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

 PRODUCT_PACKAGES += \
    libnl_2 \
    libtinyxml

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    resize2fs \
    setup_fs \
    ext4_resize \
    resize_ext4 \
    superumount

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8

# Dalvik/HWUI
$(call inherit-product-if-exists, frameworks/native/build/phone-xxxhdpi-3072-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxxhdpi-3072-hwui-memory.mk)
