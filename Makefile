.PHONY: get clean test analyze format

# Get dependencies in all packages
get:
	@echo "Getting dependencies..."
	@flutter pub get
	@for dir in packages/core/* packages/features/*; do \
		if [ -d "$$dir" ]; then \
			echo "Getting dependencies for $$dir..."; \
			(cd "$$dir" && flutter pub get); \
		fi \
	done

# Clean all packages
clean:
	@echo "Cleaning project..."
	@flutter clean
	@for dir in packages/core/* packages/features/*; do \
		if [ -d "$$dir" ]; then \
			echo "Cleaning $$dir..."; \
			(cd "$$dir" && flutter clean); \
		fi \
	done

# Run tests in all packages
test:
	@echo "Running tests..."
	@if [ -d "test" ]; then \
		echo "Running root tests..."; \
		flutter test; \
	else \
		echo "No root tests found"; \
	fi
	@for dir in packages/core/* packages/features/*; do \
		if [ -d "$$dir" ]; then \
			if [ -d "$$dir/test" ]; then \
				echo "Running tests for $$dir..."; \
				(cd "$$dir" && flutter test); \
			else \
				echo "No tests found for $$dir"; \
			fi \
		fi \
	done

# Run analysis in all packages
analyze:
	@echo "Analyzing project..."
	@flutter analyze
	@for dir in packages/core/* packages/features/*; do \
		if [ -d "$$dir" ]; then \
			echo "Analyzing $$dir..."; \
			(cd "$$dir" && flutter analyze); \
		fi \
	done

# Format all code
format:
	@echo "Formatting code..."
	@dart format .
