PYTHON := python3.11
VENV := .venv
PIP := $(VENV)/bin/pip

.DEFAULT_GOAL := help

.PHONY: help installcompile-requirements clean venv

help:
	@echo "Available commands:"
	@echo "  make install              - Create venv and install dependencies"
	@echo "  make compile-requirements - Rebuild lock files with pip-tools"
	@echo "  make clean                - Clean up Python cache and venv"

venv:
	@echo "Creating virtual environment..."
	$(PYTHON) -m venv $(VENV)

install: venv
	@echo "Installing dependencies..."
	$(PIP) install -r requirements.txt
	@echo "Done! Activate with: source $(VENV)/bin/activate"

compile-requirements: venv
	@echo "Compiling requirement lock files..."
	$(PIP) install pip-tools
	$(VENV)/bin/pip-compile requirements.in --output-file requirements.txt
	@echo "Requirements lock files updated."

clean:
	@echo "Cleaning up..."
	rm -rf **/__pycache__ .pytest_cache .coverage dist build $(VENV)
	@echo "Clean up complete"