LOCAL_PATH:= $(call my-dir)
ifeq (0,1)
include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
        $(LOCAL_PATH)/feature_stab/db_vlvm \
        $(LOCAL_PATH)/feature_stab/src \
        $(LOCAL_PATH)/feature_stab/src/dbreg \
        $(LOCAL_PATH)/feature_mos/src \
        $(LOCAL_PATH)/feature_mos/src/mosaic

LOCAL_CFLAGS := -O3 -DNDEBUG -fstrict-aliasing

LOCAL_SRC_FILES := \
        feature_mos_jni.cpp \
        mosaic_renderer_jni.cpp \
        feature_mos/src/mosaic/trsMatrix.cpp \
        feature_mos/src/mosaic/AlignFeatures.cpp \
        feature_mos/src/mosaic/Blend.cpp \
        feature_mos/src/mosaic/Delaunay.cpp \
        feature_mos/src/mosaic/ImageUtils.cpp \
        feature_mos/src/mosaic/Mosaic.cpp \
        feature_mos/src/mosaic/Pyramid.cpp \
        feature_mos/src/mosaic_renderer/Renderer.cpp \
        feature_mos/src/mosaic_renderer/WarpRenderer.cpp \
        feature_mos/src/mosaic_renderer/SurfaceTextureRenderer.cpp \
        feature_mos/src/mosaic_renderer/YVURenderer.cpp \
        feature_mos/src/mosaic_renderer/FrameBuffer.cpp \
        feature_stab/db_vlvm/db_feature_detection.cpp \
        feature_stab/db_vlvm/db_feature_matching.cpp \
        feature_stab/db_vlvm/db_framestitching.cpp \
        feature_stab/db_vlvm/db_image_homography.cpp \
        feature_stab/db_vlvm/db_rob_image_homography.cpp \
        feature_stab/db_vlvm/db_utilities.cpp \
        feature_stab/db_vlvm/db_utilities_camera.cpp \
        feature_stab/db_vlvm/db_utilities_indexing.cpp \
        feature_stab/db_vlvm/db_utilities_linalg.cpp \
        feature_stab/db_vlvm/db_utilities_poly.cpp \
        feature_stab/src/dbreg/dbreg.cpp \
        feature_stab/src/dbreg/dbstabsmooth.cpp \
        feature_stab/src/dbreg/vp_motionmodel.c

LOCAL_SDK_VERSION := 9

LOCAL_LDFLAGS := -llog -lGLESv2

LOCAL_MODULE_TAGS := optional

LOCAL_PRODUCT_MODULE := true

LOCAL_MODULE    := libjni_snapcammosaic
include $(BUILD_SHARED_LIBRARY)

# TinyPlanet
include $(CLEAR_VARS)

LOCAL_CPP_EXTENSION := .cc
LOCAL_LDFLAGS   := -llog -ljnigraphics
LOCAL_SDK_VERSION := 9
LOCAL_PRODUCT_MODULE := true
LOCAL_MODULE    := libjni_snapcamtinyplanet
LOCAL_SRC_FILES := tinyplanet.cc

LOCAL_CFLAGS    += -ffast-math -O3 -funroll-loops
LOCAL_ARM_MODE := arm

include $(BUILD_SHARED_LIBRARY)

# ImageUtilForCamera2 with beautification
include $(CLEAR_VARS)
LOCAL_LDFLAGS   := -llog
LOCAL_SDK_VERSION := 9
LOCAL_PRODUCT_MODULE := true
LOCAL_MODULE    := libjni_imageutil
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := image_util_jni.cpp
LOCAL_CFLAGS    += -ffast-math -O3 -funroll-loops
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_LDFLAGS   := -llog
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE    := libjni_mfnrutil
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := mfnr_util_jni.cpp
LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_C_INCLUDES :=  camxmfnrwrapper.h \
                     $(TARGET_OUT_HEADERS)/camx
LOCAL_SHARED_LIBRARIES := libmmcamera_mfnr liblog libcutils libm libGLESv3 libEGL libopencv
LOCAL_HEADER_LIBRARIES := jni_headers vendor_common_inc
LOCAL_CFLAGS    += -ffast-math -O3 -funroll-loops
LOCAL_NOSANITIZE := cfi flag
LOCAL_USE_VNDK := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_LDFLAGS   := -llog
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE    := libjni_aidenoiserutil
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := aidenoiser_util_jni.cpp
LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_C_INCLUDES :=  aidenoiserengine.h
LOCAL_SHARED_LIBRARIES := libaidenoiser liblog libcutils libm libGLESv3 libEGL libopencv
LOCAL_HEADER_LIBRARIES := jni_headers vendor_common_inc
LOCAL_CFLAGS    += -ffast-math -O3 -funroll-loops
LOCAL_NOSANITIZE := cfi flag
LOCAL_USE_VNDK := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_LDFLAGS   := -llog
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE    := libjni_aidenoiserutilv2
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := aidenoiserv2_util_jni.cpp
LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_C_INCLUDES :=  aidenoiserv2/aidenoiserenginev2.h
LOCAL_SHARED_LIBRARIES := libaidenoiserv2 liblog libcutils libm libGLESv3 libEGL libopencv
LOCAL_HEADER_LIBRARIES := jni_headers vendor_common_inc
LOCAL_CFLAGS    += -ffast-math -O3 -funroll-loops
LOCAL_NOSANITIZE := cfi flag
LOCAL_USE_VNDK := true
include $(BUILD_SHARED_LIBRARY)

endif
