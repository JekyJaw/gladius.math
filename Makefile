################################################################################
# NOTES:
#
# This Makefile assumes that you have the following installed, setup:
#
#  * node: http://nodejs.org
#  * Unixy shell (use msys on Windows)
#
################################################################################

SRC_DIR := ./src
TEST_DIR := ./test
TOOLS_DIR := ./tools
EXTERNAL_DIR := ./external

CORE_FILES := $(SRC_DIR)/Math.js $(wildcard $(TEST_DIR)/*.js)

jshint = echo "Linting $(1)" ; node $(TOOLS_DIR)/jshint-cmdline.js $(1)

check-lint: check-lint-all

check-lint-all:
	@@$(foreach corefile,$(CORE_FILES),echo "-----" ; $(call jshint,$(corefile)) ; )

submodule:
	@@git submodule update --init --recursive
	@@git submodule status --recursive
