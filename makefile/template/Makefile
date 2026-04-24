# --- 1. Core Configuration ---
SHELL         := /bin/bash
PROJECT_NAME  ?= {{ ProjectName }} 
VERSION       ?= $(shell git describe --tags --always || echo "0.0.1")

# --- 2. Tooling Overrides (The "Generic" part) ---
# Change these variables based on the project type (Go, Python, K8s, etc.)
BUILD_CMD     ?= @echo "No build step defined"
TEST_CMD      ?= @echo "No test step defined"
RUN_CMD       ?= @echo "No run step defined"
CLEAN_TARGETS ?= ./dist ./bin

# --- 3. Display Settings ---
# Use these for consistent UI output
INFO  := @printf "\033[36m【INFO】\033[0m %s\n"
WARN  := @printf "\033[33m【WARN】\033[0m %s\n"
ERR   := @printf "\033[31m【ERR】\033[0m %s\n"

# Standard Makefile flags
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

.PHONY: help build test run clean setup

# --- 4. The Interface ---

## help: Show this help message
help:
	@echo "Usage: make [target] [variables]"
	@echo ""
	@sed -n 's/^##//p' $(MAKEFILE_LIST) | column -t -s ':' |  sed -e 's/^/ /'

## setup: Install dependencies and prepare environment
setup:
	$(INFO) "Setting up project: $(PROJECT_NAME)"
	@# Logic for pip install, go mod tidy, etc.

## build: Compile or package the project
build:
	$(INFO) "Building $(PROJECT_NAME)..."
	$(BUILD_CMD)

## test: Run unit and integration tests
test:
	$(INFO) "Running tests..."
	$(TEST_CMD)

## run: Execute the application locally
run:
	$(INFO) "Starting $(PROJECT_NAME)..."
	$(RUN_CMD)

## clean: Remove build artifacts and temporary files
clean:
	$(INFO) "Cleaning up..."
	rm -rf $(CLEAN_TARGETS)

# --- 5. Variable Validation Helper ---
# Use this to ensure required CLI arguments are passed
define require-var
	$(if $($(1)),,$(error Missing required variable '$(1)'. Usage: make $(2) $(1)=<value>))
endef
