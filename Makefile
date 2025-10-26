.PHONY: format lint test test-cov test-fast clean install dev-install help

#############################
# Help
#############################

help:  ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

#############################
# Installation
#############################

install:  ## Install package in production mode
	uv pip install -e .

dev-install:  ## Install package with development dependencies
	uv pip install -e ".[dev]"

#############################
# Format and lint
#############################

PYTHON_FILES=.
MYPY_CACHE=.mypy_cache
lint format: PYTHON_FILES=.
lint_tests: PYTHON_FILES=tests
lint_tests: MYPY_CACHE=.mypy_cache_tests

format:  ## Format code with ruff
	uv run ruff format $(PYTHON_FILES)
	uv run ruff check --select I --fix $(PYTHON_FILES)

lint:  ## Lint and type check code
	uv run ruff check --fix .
	[ "" = "$(PYTHON_FILES)" ] || uv run ruff format $(PYTHON_FILES)
	[ "" = "$(PYTHON_FILES)" ] || uv run ruff check --select I $(PYTHON_FILES)
	[ "" = "$(PYTHON_FILES)" ] || mkdir -p $(MYPY_CACHE) && uv run mypy --cache-dir $(MYPY_CACHE) $(PYTHON_FILES)

lint_tests:  ## Lint test files specifically
	uv run ruff check --fix .
	[ "" = "$(PYTHON_FILES)" ] || uv run ruff format $(PYTHON_FILES)
	[ "" = "$(PYTHON_FILES)" ] || uv run ruff check --select I $(PYTHON_FILES)
	[ "" = "$(PYTHON_FILES)" ] || mkdir -p $(MYPY_CACHE) && uv run mypy --cache-dir $(MYPY_CACHE) $(PYTHON_FILES)

#############################
# Testing
#############################

test:  ## Run all tests
	uv run pytest tests/ -v

test-cov:  ## Run tests with coverage report
	uv run pytest tests/ --cov=learn_langgraph --cov-report=html --cov-report=term

test-fast:  ## Run tests in parallel (fast)
	uv run pytest tests/ -n auto

test-watch:  ## Run tests in watch mode
	uv run pytest-watch -- tests/

test-integration:  ## Run integration tests only
	uv run pytest tests/ -m integration -v

test-unit:  ## Run unit tests only (skip slow/integration)
	uv run pytest tests/ -m "not slow and not integration" -v

#############################
# Cleaning
#############################

clean:  ## Clean up generated files and caches
	rm -rf build dist *.egg-info
	rm -rf .pytest_cache .mypy_cache .ruff_cache
	rm -rf htmlcov .coverage .coverage.*
	rm -rf .testmondata .testmondata.journal
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete

#############################
# Development tools
#############################

notebook:  ## Start Jupyter Lab
	uv run jupyter lab

langgraph-dev:  ## Start LangGraph development server
	uv run langgraph dev

pre-commit-install:  ## Install pre-commit hooks
	uv run pre-commit install

pre-commit-run:  ## Run pre-commit on all files
	uv run pre-commit run --all-files
