.PHONY: lint check format help all

lint:
	cargo clippy --all -- -D warnings
	cargo clippy --tests -- -D warnings

check:
	@if ! cargo install --list | grep -q machete; then \
		echo "Installing machete"; \
		cargo install cargo-machete; \
		cargo machete; \
	else \
		cargo machete; \
	fi

format:
	cargo +nightly fmt --all

all: format lint check

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@echo "  All       Runs all the commands"
	@echo "  lint      Run Clippy linter on all crates and tests"
	@echo "  check     Check for updates and changes in the workspace using cargo-machete"
	@echo "  format    Format the code using cargo fmt"
	@echo "  help      Display this help message"
