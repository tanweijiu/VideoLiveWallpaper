# Copyright 2011 Uriel Avalos and Frank and Robot Productions

# This software uses libraries from FFmpeg licensed under the LGLv2.1.

# This software uses GLWallpaperService licensed under the Apache v2.

# This file is part of FFvideo Live Wallpaper.

# FFvideo Live Wallpaper is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# FFvideo Live Wallpaper is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with FFvideo Live Wallpaper.  If not, see <http://www.gnu.org/licenses/>.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
MY_LIB_PATH := ffmpeg-android/build/ffmpeg/armeabi/lib
LOCAL_MODULE := avcore
LOCAL_SRC_FILES := $(MY_LIB_PATH)/libavcore.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := avformat
LOCAL_SRC_FILES := $(MY_LIB_PATH)/libavformat.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := avcodec
LOCAL_SRC_FILES := $(MY_LIB_PATH)/libavcodec.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := avfilter
LOCAL_SRC_FILES := $(MY_LIB_PATH)/libavfilter.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := avutil
LOCAL_SRC_FILES := $(MY_LIB_PATH)/libavutil.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := swscale
LOCAL_SRC_FILES := $(MY_LIB_PATH)/libswscale.so
include $(PREBUILT_SHARED_LIBRARY)

#local_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CFLAGS := -DANDROID_NDK \
                -DDISABLE_IMPORTGL

LOCAL_MODULE    := video
LOCAL_SRC_FILES := video.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/ffmpeg-android/ffmpeg 
#LOCAL_LDLIBS := -L$(NDK_PLATFORMS_ROOT)/$(TARGET_PLATFORM)/arch-arm/usr/lib -L$(LOCAL_PATH) -L$(LOCAL_PATH)/ffmpeg-android/build/ffmpeg/armeabi/lib/ -lGLESv1_CM -ldl -lavformat -lavcodec -lavfilter -lavutil -lswscale -llog -lz -lm
LOCAL_LDLIBS := -llog -lm -lz -landroid -ldl
LOCAL_LDLIBS += -lGLESv1_CM 
LOCAL_SHARED_LIBRARIES := avcore avformat avcodec avfilter avutil swscale

include $(BUILD_SHARED_LIBRARY)
