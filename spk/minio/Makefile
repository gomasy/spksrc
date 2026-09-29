SPK_NAME = minio
SPK_VERS = 2026.08.04
SPK_REV = 18
SPK_ICON = src/minio.png
DSM_UI_DIR = app

DEPENDS = cross/minio cross/minio-client

UNSUPPORTED_ARCHS = $(PPC_ARCHS) $(ARMv5_ARCHS)

MAINTAINER = gomasy
DESCRIPTION = Silo is a maintained fork of MinIO, a high performance object storage server compatible with Amazon S3 APIs. This Package includes the 'minio-client' \(mc\).
DISPLAY_NAME = MinIO
CHANGELOG = "1. Switch upstream to gomasy/silo and pgsty/mc, maintained forks of MinIO and MinIO Client. <br/>2. Update to RELEASE.2026-08-04T00-00-00Z. <br/>3. Drop support for ARMv5 (requires go >= 1.26.5)."
LICENSE_FILE = $(WORK_DIR)/src/github.com/minio/minio/LICENSE
HOMEPAGE = https://github.com/gomasy/silo
LICENSE = AGPLv3.0

WIZARDS_DIR = src/wizard

STARTABLE = yes
SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_WIZARD_SHARENAME = wizard_data_directory
FWPORTS = src/minio.sc
# Console Port (API Port is 9000)
ADMIN_PORT = 9001

POST_STRIP_TARGET = minio_extra_install

# official binary is "mc" not "minio-client", but "mc" is already used for midnight-commander
SPK_COMMANDS = bin/minio-client

include ../../mk/spksrc.spk.mk

.PHONY: minio_extra_install
minio_extra_install:
	@install -d -m 755 $(STAGING_DIR)/var
	@install -m 644 src/environment-variables $(STAGING_DIR)/var/
