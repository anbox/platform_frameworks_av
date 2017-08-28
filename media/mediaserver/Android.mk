LOCAL_PATH:= $(call my-dir)

ifneq ($(BOARD_USE_CUSTOM_MEDIASERVEREXTENSIONS),true)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := register.cpp
LOCAL_MODULE := libregistermsext
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -Werror -Wall
include $(BUILD_STATIC_LIBRARY)
endif

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	main_mediaserver.cpp

LOCAL_SHARED_LIBRARIES := \
	libcamera_metadata \
	libcamera_client \
	libcameraservice \
	libresourcemanagerservice \
	libcutils \
	libmedia \
	libmediaplayerservice \
	libutils \
	libbinder \
	libicuuc \

LOCAL_STATIC_LIBRARIES := \
        libicuandroid_utils \
        libregistermsext

LOCAL_C_INCLUDES := \
    frameworks/av/media/libmediaplayerservice \
    frameworks/av/services/camera/libcameraservice \
    frameworks/av/services/mediaresourcemanager \

LOCAL_MODULE:= mediaserver
ifeq ($(strip $(MEDIASERVER_MULTILIB)),)
LOCAL_MULTILIB := 32
else
LOCAL_MULTILIB := $(MEDIASERVER_MULTILIB)
endif

LOCAL_INIT_RC := mediaserver.rc

LOCAL_CFLAGS := -Werror -Wall

include $(BUILD_EXECUTABLE)
