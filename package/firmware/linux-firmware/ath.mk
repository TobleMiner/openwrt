Package/wil6210-firmware = $(call Package/firmware-default,Atheros Wil6210 firmware)
define Package/wil6210-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/wil6210.fw \
		$(PKG_BUILD_DIR)/wil6210.brd \
		$(1)/lib/firmware/
endef
$(eval $(call BuildPackage,wil6210-firmware))
