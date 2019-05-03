# source .env

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = testbackboarddhooking
testbackboarddhooking_FILES = Tweak.x
testbackboarddhooking_FRAMEWORKS = Foundation UIKit
		
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "launchctl stop com.apple.backboardd"
