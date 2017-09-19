#
# See ./CONTRIBUTING.rst
#

lint: ## Make Lint Files
	@make clean
	pre-commit run --all-files --verbose

test: ## make test
	@make clean
	@echo $(MESSAGE) Running tests on the current Python interpreter with coverage $(END)
	docker-compose -f docker-compose.yml -f docker-compose/test.yml run --rm app \
		py.test --cov docker-python-tesseract --cov tests --doctest-modules --verbose docker-python-tesseract tests
	@echo