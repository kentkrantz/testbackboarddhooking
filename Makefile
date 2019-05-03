# source .env

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = testbackboarddhooking
testbackboarddhooking_FILES = backboardd.x Log.m

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "launchctl stop com.apple.backboardd"
