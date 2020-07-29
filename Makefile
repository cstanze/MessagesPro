ARCHS = arm64 arm64e
TARGET = iphone:clang:13.2:13.0
THEOS_DEVICE_IP = 192.168.1.248

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MessagesPro
MessagesPro_FILES = MessagesPro.xm
MessagesPro_FRAMEWORKS = UIKit Foundation
MessagesPro_PRIVATE_FRAMEWORKS = ChatKit
MessagesPro_EXTRA_FRAMEWORKS = Cephei
MessagesPro_CFLAGS = -fobjc-arc
MessagesPro_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += messagesproprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 MobileSMS"
	install.exec "killall -9 Preferences"