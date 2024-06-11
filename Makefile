# Makefile for managing the todolist1 script

# Define the installation directory
PREFIX ?= /usr/local/bin

# Define the script name
SCRIPT = todolist1

# Install the script
install:
	@echo "Installing $(SCRIPT) to $(PREFIX)..."
	@install -m 0755 $(SCRIPT) $(PREFIX)/$(SCRIPT)
	@echo "Installation completed."

# Uninstall the script
uninstall:
	@echo "Removing $(SCRIPT) from $(PREFIX)..."
	@rm -f $(PREFIX)/$(SCRIPT)
	@echo "Uninstallation completed."

# Clean up (typically unnecessary for a single shell script)
clean:
	@echo "Nothing to clean."

# Default target
all: help

# Display help information
help:
	@echo "Usage:"
	@echo "  make install   - Install the script"
	@echo "  make uninstall - Uninstall the script"
	@echo "  make clean     - Clean up any build artifacts (if applicable)"

