# Makefile for todolist script

TODO_DIR=$(HOME)/.todo

# Install todolist script
install:
	mkdir -p $(TODO_DIR)
	chmod +x todolist
	sudo ln -sf $(PWD)/todolist /usr/local/bin/todolist

# Test the todolist script
test:
	@echo "Running tests..."
	@echo "Creating a sample task..."
	todolist -a < sample_task_input.txt
	@echo "Listing tasks..."
	todolist -v
	@echo "Tests completed."

# Remove symbolic links
clean:
	sudo rm -f /usr/local/bin/todolist

# Uninstall todolist script and clean up
uninstall: clean
	rm -rf $(TODO_DIR)

