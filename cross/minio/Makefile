PKG_NAME = minio
PKG_VERS = 2026-08-04T00-00-00Z
PKG_RELEASE_TAG = $(subst :,-,$(PKG_VERS))
PKG_COMMIT_ID = 61632bb2bf33afb13c59953a87cf9b6d84dadf16
PKG_EXT = tar.gz
PKG_DIST_PREFIX = RELEASE.$(PKG_RELEASE_TAG)
PKG_DIST_NAME = $(PKG_DIST_PREFIX).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/gomasy/silo/archive
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_DIST_NAME)
EXTRACT_PATH = $(WORK_DIR)/src/github.com/$(PKG_NAME)
PKG_DIR = silo-$(PKG_DIST_PREFIX)

# requires go >= 1.26.5
UNSUPPORTED_ARCHS = $(PPC_ARCHS) $(ARMv5_ARCHS)

BUILD_DEPENDS = native/go

HOMEPAGE = https://github.com/gomasy/silo
COMMENT  = Silo is a maintained fork of MinIO, a high performance object storage server compatible with Amazon S3 APIs.
LICENSE  = AGPLv3.0

POST_EXTRACT_TARGET = minio_post_extract

GO_SRC_DIR = $(EXTRACT_PATH)/$(PKG_NAME)
GO_BIN_DIR = $(GO_SRC_DIR)/$(PKG_NAME)

ENV += GO111MODULE=on

GO_BUILD_ARGS = -tags kqueue -buildvcs=false

GO_LDFLAGS  = -s -w
GO_LDFLAGS += -X github.com/minio/minio/cmd.Version=$(PKG_VERS)
GO_LDFLAGS += -X github.com/minio/minio/cmd.ReleaseTag=$(PKG_RELEASE_TAG)
GO_LDFLAGS += -X github.com/minio/minio/cmd.CommitID=$(PKG_COMMIT_ID)
GO_LDFLAGS += -X github.com/minio/minio/cmd.ShortCommitID=$(shell echo $(PKG_COMMIT_ID) | cut -c1-12)
GO_LDFLAGS += -X github.com/minio/minio/cmd.CopyrightYear=$(firstword $(subst -, ,$(PKG_VERS)))

include ../../mk/spksrc.cross-go.mk

# rename extracted folder to make imports work when used as GOPATH
.PHONY: minio_post_extract
minio_post_extract:
	cd $(EXTRACT_PATH) && [ -d $(PKG_DIR) ] && mv $(PKG_DIR) $(PKG_NAME)
