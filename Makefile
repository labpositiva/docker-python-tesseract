#
# See ./CONTRIBUTING.rst
#

TAG:=""
END:=""

.PHONY: build deploy lint test help
.DEFAULT_GOAL := help

PROJECT_NAME := docker-python-tesseract
PROJECT_NAME_DEV := $(PROJECT_NAME)_dev
PROJECT_NAME_STAGE := $(PROJECT_NAME)_stage
PROJECT_NAME_TEST := $(PROJECT_NAME)_test

PYTHON_VERSION=3.6.1
PYENV_NAME="${PROJECT_NAME}"

# Configuration.
SHELL=/bin/bash
ROOT_DIR=$(shell pwd)
MESSAGE:="༼ つ ◕_◕ ༽つ"
MESSAGE_HAPPY:="${MESSAGE} Happy Coding"
SCRIPT_DIR=$(ROOT_DIR)/extras/scripts
SOURCE_DIR=$(ROOT_DIR)/src
REQUIREMENTS_DIR=$(ROOT_DIR)/requirements/
FILE_README=$(ROOT_DIR)/README.rst


include docker.make
include tests.make
include docs.make
include utils.make

help: ## Show help text
	@echo $(MESSAGE) "Commands"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-20s\033[0m %s\n", $$1, $$2}'
