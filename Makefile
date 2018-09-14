THEOS = /opt/theos
THEOS_DEVICE_IP = 192.168.2.51

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = testbackboarddhooking
testbackboarddhooking_FILES = backboardd.x Log.m
testbackboarddhooking_FRAMEWORKS = Foundation UIKit
		
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "launchctl stop com.apple.backboardd"
