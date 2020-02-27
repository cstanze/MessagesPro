INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MessagesPro
export TARGET = iphone:clang:13.2:13.2
MessagesPro_FILES = Tweak.xm
ARCHS = arm64 arm64e
MessagesPro_FRAMEWORKS = UIKit Foundation
MessagesPro_PRIVATE_FRAMEWORKS = ChatKit
MessagesPro_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
