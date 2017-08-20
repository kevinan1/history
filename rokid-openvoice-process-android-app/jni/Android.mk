#git clone https://bitbucket.org/victorlazzarini/android-audiotest

LOCAL_PATH := $(call my-dir)
include $(call all-subdir-makefiles)

include $(CLEAR_VARS)
LOCAL_MODULE := libopenvoice
LOCAL_SRC_FILES := \
		src/audio_recorder.cpp \
        src/opensl_io.c \
        src/VoiceService.cpp \
        src/VoiceCallback.cpp
    
LOCAL_SHARED_LIBRARIES := \
        libbsiren \
        libspeech

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_LDLIBS := -llog -lOpenSLES
LOCAL_CFLAGS += -std=c++11
include $(BUILD_SHARED_LIBRARY)

#===========================================
#
include $(CLEAR_VARS)
LOCAL_MODULE := libopenvoicedd
LOCAL_SRC_FILES := src/com_rokid_openvoice_VoiceNative.cpp
        
LOCAL_LDLIBS := -llog
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_SHARED_LIBRARIES := libopenvoice
LOCAL_CFLAGS += -std=c++11
    
include $(BUILD_SHARED_LIBRARY)