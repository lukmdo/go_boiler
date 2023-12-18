SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail


help: ## Display this help screen
	@grep -E '^[\.a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup: ## Setup|install
	pre-commit install
	pre-commit install-hooks
	go mod tidy

.PHONY: lint
lint: ## Lint all files
	pre-commit run --all-files


# Example:
# 	make test ARGS="-bench"
.PHONY: test
test:  ## Test go
	go test -timeout=1m -v $(ARGS) .

.PHONY: test-coverage
test-coverage:  ## Test go +cov
test-coverage: override ARGS := -coverprofile=coverage.out $(ARGS)
test-coverage: test

clean:  ## Remove temp dirs|files
	git clean -d -f $(ARGS)

clean-show: ## Show cleanup items (dry run)
clean-show: ARGS := -n
clean-show: clean
