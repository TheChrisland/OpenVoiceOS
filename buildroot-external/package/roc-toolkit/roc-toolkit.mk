################################################################################
#
# roc-toolkit
#
################################################################################

ROC_TOOLKIT_VERSION = 127cfc645d0a807a33506001367b6d9a9d46f23e
ROC_TOOLKIT_SITE = $(call github,roc-streaming,roc-toolkit,$(ROC_TOOLKIT_VERSION))
ROC_TOOLKIT_LICENSE = MPL-2.0
ROC_TOOLKIT_LICENSE_FILES = LICENSE
ROC_TOOLKIT_INSTALL_STAGING = YES

ROC_TOOLKIT_DEPENDENCIES = \
	host-scons \
	host-pkgconf \
	host-ragel \
	gst1-libav \
	libunwind \
	openfec \
	speexdsp \
	sox \
	pulseaudio

define ROC_TOOLKIT_BUILD_CMDS
	(cd $(@D); \
	$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
		$(SCONS) $(ROCTOOLKIT__SCONS_OPTS))
endef

define ROC_TOOLKIT_INSTALL_STAGING_CMDS
	(cd $(@D); \
	$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
		$(SCONS) --prefix="$(STAGING_DIR)/usr" install)
endef

define ROC_TOOLKIT_INSTALL_TARGET_CMDS
	(cd $(@D); \
	$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
		$(SCONS) --prefix="$(TARGET_DIR)/usr" install)
endef

$(eval $(generic-package))
